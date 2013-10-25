simpleblog
==========

Simple blog engine for rails applications


## To install

1. Add simpleblog to your Gemfile & run `bundle install`

	```ruby
	gem "simpleblog"
	```

2. Mount the Simpleblog engine in your routes.rb

	```ruby
	mount Simpleblog::Engine, at: "blog"
	```

3. Install the migrations and run them
	
	```
	rake simpleblog:install:migrations
	rake db:migrate
	```

4. Open [localhost:3000/blog](http://localhost:3000/blog) to see your blog