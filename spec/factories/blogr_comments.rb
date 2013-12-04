# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogr_comment, :class => 'Blogr::Comment' do
    post_id 1
    user_id 1
    content "MyText"
    author_name "MyString"
    author_email "MyString"
  end
end
