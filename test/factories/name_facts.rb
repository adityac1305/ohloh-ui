FactoryGirl.define do
  factory :name_fact do
    association :analysis
    association :name
    association :primary_language, factory: :language
  end
end