require 'json'
require 'pry'

class Flash
  attr_reader :now

  def initialize(req)
    @flash = {
      flash_1: {},
      flash_2: {}
    }

    @now = @flash[:flash_2]

    if req.cookies['_rails_lite_app_flash']
      @flash[:flash_2] = JSON.parse(req.cookies['_rails_lite_app_flash'])
    end
  end

  def [](key)
    flash_1 = @flash[:flash_1]
    flash_2 = @flash[:flash_2]
    all_flash = flash_2.merge(flash_1)
    all_flash[key.to_s]
  end

  def []=(key, val)
    @flash[:flash_1][key.to_s] = val
  end

  def store_flash(res)
    res.set_cookie('_rails_lite_app_flash', {path: '/', value: @flash[:flash_1].to_json})
  end
end
