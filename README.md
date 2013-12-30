# Blogr

[![Build Status](https://travis-ci.org/blogr/engine.png?branch=testing)](https://travis-ci.org/blogr/engine)  [![Dependency Status](https://gemnasium.com/blogr/engine.png)](https://gemnasium.com/blogr/engine)  [![Code Climate](https://codeclimate.com/github/blogr/engine.png)](https://codeclimate.com/github/blogr/engine)  [![Coverage Status](https://coveralls.io/repos/blogr/engine/badge.png)](https://coveralls.io/r/blogr/engine)  

A Rails engine for adding blogging to any Rails 4 application.

*Currently in development.*

Some code from [pixelbits/simpleblog](https://github.com/pixelbits/simpleblog).

Blogr is a framework for your blog with an admin. You are required to create the blog frontend.

For a working & in production preview, see [Rails Tuts](http://railstuts.net). The source of the site is on [GitHub](https://github.com/railstuts/site).

![](http://s.vou.pe/GUpWX.png)

## To install

1. Add blogr to your Gemfile & run `bundle install`

	```ruby
	gem "blogr"
	```

2. Run the setup generator to add blogr to routes.rb and to add some config files

	```
	rails g blogr:setup
	```

3. Run the database migrations and 
	
	```
	rake db:migrate blogr:setup
	```

4. Insert into your `db/seeds.rb` file command `Blogr::Engine.load_seed` and create a Blogr user

  ```
  rake db:seed
  ```

5. Run the server and open [localhost:3000/blogr](http://localhost:3000/blogr) to see the Blogr interface.

  ```
  rails s
  ```

## Importing Posts

I am currently working on some importing tools for importing posts from other blogging platforms.

### WordPress

This imports categories and posts from your WordPress blog.

- Login to your WordPress blog, go to Tools > Export and download the XML file
- Open up the Rails console - `rails console`
- Run the importer

```ruby
Blogr::Import.wordpress("path-to-your-export.xml")
```
