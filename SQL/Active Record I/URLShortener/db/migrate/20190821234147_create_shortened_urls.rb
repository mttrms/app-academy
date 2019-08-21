class CreateShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url
      t.string :short_url
      t.references :user, index: true
    end
  end
end
