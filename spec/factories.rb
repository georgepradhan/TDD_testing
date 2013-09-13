require 'faker'
FactoryGirl.define do

  factory :menu do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    start_at { Time.now }
    end_at { Time.now + 100 }
    # factory :menu_with_items do
    #   after_create do |menu|
    #     3.times { create(:menu_item, menu: menu) }
    #   end
    # end
  end 

  factory :menu_item do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    price { rand(1..100) }
    menu
  end 

end