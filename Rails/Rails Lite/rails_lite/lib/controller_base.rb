require 'active_support'
require 'active_support/core_ext'
require 'erb'
require 'pry'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, route_params = {})
    @req = req
    @res = res
    @params = route_params.merge(req.params)
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "Already Built Response" if already_built_response?

    @res.status = 302
    @res['Location'] = url
    session.store_session(res)

    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "Already Built Response" if already_built_response?

    @res['Content-Type'] = content_type
    @res.write(content)
    session.store_session(res)

    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    controller_dir = ActiveSupport::Inflector.underscore(self.class.name)
    template_name = "#{template_name}.html.erb"
    template_location = File.join("views", controller_dir, template_name)

    template = File.read(template_location)
    rendered_template = ERB.new(template).result(binding)

    render_content(rendered_template, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    self.send(name)
    render unless already_built_response?
  end
end

