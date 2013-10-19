# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :simpleblog_image, :class => 'Image' do
    post_id 1
  end
end
