# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ned = User.create!(
  user_name: "ruggeri",
  first_name: "Ned",
  last_name: "Ruggeri"
)

jonathan = User.create!(
  user_name: "tamboer",
  first_name: "Jonathan",
  last_name: "Tamboer"
)

first_post = ned.posts.create!(
  title: "First post!",
  body: "First posting is fun!"
)

comment1 = first_post.comments.create!(
  body: "Great job first posting!",
  author_id: jonathan.id
)

comment2 = comment1.replies.create!(
  body: "Thanks!",
  post_id: comment1.post_id,
  author_id: ned.id
)
