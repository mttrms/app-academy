require 'rack'
require 'json'

class RackApplication
  def self.call(env)
    ['200', {'Content-Type' => 'text/html'}, ["Hello"]]
  end
end

class SimpleApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    name = req.params['name']
    res.write("Hello #{name}")

    res.finish
  end
end

class CookieApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new
    food = req.params['food']

    if food
      res.set_cookie(
        '_my_cookie_app',
        {
          path: '/',
          value: {food: food}.to_json
        }
      )
    else
      cookie = req.cookies['_my_cookie_app']
      cookie_val = JSON.parse(cookie)
      food = cookie_val['food']
      res.write("Your favorite food is #{food}")
    end

    res.finish
  end
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new

  if req.path.start_with?("/cage")
    res.status = 301
    res['Location'] = 'https://vignette.wikia.nocookie.net/mspaintadventures/images/4/4b/Nicolas_Cage.png/revision/latest?cb=20121218135205'
  else
    res.write("Nothing to see here")
  end

  res.finish
end

Rack::Server.start({
  app: app,
  Port: 3000
})
