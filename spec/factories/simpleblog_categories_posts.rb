# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :simpleblog_categories_post, :class => 'CategoriesPost' do
    post_id 1
    category_id 1
  end
end
