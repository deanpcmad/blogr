# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :simpleblog_post, :class => 'Simpleblog::Post' do
    title "Blog's title"
    content "something wrong happening there"
    status "draft"

    factory :simpleblog_post_public do
      title "this is my public post"
      status "public"
      published_at Time.now  - 2.days
    end

    factory :simpleblog_post_public_delayed do
      title "this is my public delayed post"
      status "public"
      published_at Time.now + 2.days
    end

  end
end
