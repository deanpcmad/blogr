# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :simpleblog_category, :class => 'Category' do
    title "MyString"
    description "MyText"
  end
end
