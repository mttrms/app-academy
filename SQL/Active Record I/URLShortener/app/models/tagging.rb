# == Schema Information
#
# Table name: taggings
#
#  id               :bigint           not null, primary key
#  shortened_url_id :bigint
#  tag_topic_id     :bigint
#

class Tagging < ApplicationRecord
  belongs_to :shortened_url
  belongs_to :tag_topic
end
