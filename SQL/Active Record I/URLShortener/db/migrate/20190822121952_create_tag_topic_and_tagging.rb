class CreateTagTopicAndTagging < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_topics do |t|
      t.string :name
    end

    create_table :taggings do |t|
      t.references :shortened_url, index:true
      t.references :tag_topic, index:true
    end
  end
end
