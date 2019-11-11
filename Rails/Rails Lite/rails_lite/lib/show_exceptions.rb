require 'erb'
require 'pry'

class ShowExceptions
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    app.call(env)
  rescue Exception => e
    render_exception(e)
  end

  private

  def render_exception(e)
    dir_path = File.dirname(__FILE__)
    template_fname = File.join(dir_path, "templates", "rescue.html.erb")
    template = File.read(template_fname)
    body = ERB.new(template).result(binding)

    ['500', {'Content-type' => 'text/html'}, [body]]
  end

  def error_source_file(e)
    e.backtrace.first.split(':').first
  end

  def error_source_line_num(e)
    e.backtrace.first.split(':')[1]
  end

  def error_source_code(file)
    File.open(file, 'r').readlines
  end

  def extract_source_code(e)
    file = error_source_file(e)

    error_source_code(file)
  end
end
