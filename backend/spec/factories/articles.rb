FactoryBot.define do
  factory :article do
    title = Faker::JapaneseMedia::SwordArtOnline.location
    name = Faker::JapaneseMedia::SwordArtOnline.real_name
    context = Faker::JapaneseMedia::SwordArtOnline.item
    tag = Faker::JapaneseMedia::SwordArtOnline.game_name
  end
end
