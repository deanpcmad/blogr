user_params = {
  :username   => 'Username',
  :password   => 'Password',
  :first_name => 'First Name',
  :last_name  => 'Last Name',
  :email      => 'Email'
}.inject({}) do |h, (attr, name)|
  puts "#{name}:"
  print '> '
  h[attr] = STDIN.gets.chomp
  h
end

user_params[:password_confirmation] = user_params[:password]

Blogr::User.create!(user_params)
