# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :simpleblog_category, :class => 'Simpleblog::Category' do
    title "Sports"
    description "Sports are good"
  end
end
