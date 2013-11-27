# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogr_category, :class => 'Blogr::Category' do
    title "Sports"
    description "Sports are good"
  end
end
