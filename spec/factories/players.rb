# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    name "Marty McFly"
    sequence(:email) {|n| "marty.mcfly.#{n}@bttf.com" }
  end
end
