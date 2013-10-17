# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :simpleblog_post, :class => 'Post' do
    title "MyString"
    content "MyText"
  end
end
