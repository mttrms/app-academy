class AddTimestampsToShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :shortened_urls, null: true
  end
end
