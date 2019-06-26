# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  title = Faker::Book.title
  name = Faker::JapaneseMedia::SwordArtOnline.game_name
  context = Faker::Lorem.paragraph * 100
  tag = Faker::Book.genre
  Article.create(title: title, name: name, context: context, tag: tag)
end
