# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogr_post, :class => 'Blogr::Post' do
    title "Blog's title"
    content "something wrong happening there"
    permalink "blogs-title"
    published false
    published_at "2013-11-10 10:00"
    category_id 1
    user { FactoryGirl.create(:blogr_user) }
  end
end