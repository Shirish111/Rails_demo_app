# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  :username => "Shirish",
  :email => "shirishtogarla533@gmail.com",
  :password => Digest::SHA2.hexdigest("Shirish")
)
User.create(
  :username => "Govind",
  :email => "govind@gmail.com",
  :password => Digest::SHA2.hexdigest("Govind")
)
Post.create(
  :user_id => 1,
  :description => "First Post"
)
