# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogr_user, class: "Blogr::User" do
    first_name "bob"
    last_name "geldof"
    username "susan"
    email "bob@bob.com"
    password "password"
    password_confirmation "password"
  end
end