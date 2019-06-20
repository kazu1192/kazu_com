# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |n|
  title = Faker::JapaneseMedia::SwordArtOnline.location
  name = Faker::JapaneseMedia::SwordArtOnline.real_name
  context = Faker::JapaneseMedia::SwordArtOnline.item
  tag = Faker::JapaneseMedia::SwordArtOnline.game_name
  Article.create(title: title, name: name, context: context, tag: tag)
end
