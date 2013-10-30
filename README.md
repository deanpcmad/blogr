# Blogr

A Rails engine for adding blogging to any Rails 4 application.

Currently in development.

Code originally from [pixelbits/simpleblog](https://github.com/pixelbits/simpleblog).

## To install

1. Add blogr to your Gemfile & run `bundle install`

	```ruby
	gem "blogr"
	```

2. Mount the Blogr engine in your routes.rb

	```ruby
	mount Blogr::Engine, at: "blog"
	```

3. Install the migrations and run them
	
	```
	rake blogr:install:migrations
	rake db:migrate
	```

4. Open [localhost:3000/blog](http://localhost:3000/blog) to see your blog