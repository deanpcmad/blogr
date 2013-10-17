# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :simpleblog_post, :class => 'Simpleblog::Post' do
    title "MyString"
    content "MyText"
    status "draft"
  end
end
