require 'rack'
require 'pry'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  res.write("<h1>Welcome to my Rack app!</h1>")
  res.write("You are requesting: ")
  res.write("<strong>#{req.path}</strong>")
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
