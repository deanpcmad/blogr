namespace :blogr do

  desc "Create a default admin user"
  task create_default_user: :environment do
    Blogr::User.create(email_address: "admin@example.com", password: "password", password_confirmation: "password", first_name: "Default", last_name: "Admin")
    puts
    puts "Created default admin user. - Email: admin@example.com / Password: password"
    puts
  end
  
  desc "Run the key setup tasks for a new application"
  task setup: :environment do
    Rake::Task["blogr:create_default_user"].invoke if Blogr::User.all.empty?
  end
  
end