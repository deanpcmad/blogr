# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :simpleblog_post, :class => 'Simpleblog::Post' do
    title "Blog's title"
    content "something wrong happening there"
    status "draft"
  end
end
