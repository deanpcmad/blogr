require "xmlsimple"
require "reverse_markdown"

module Blogr
  
  class ImportError < StandardError; end
  
  class Import

    def self.wordpress(path)
      if File.exist?(path)
        # Open the file and parse it using XmlSimple
        f = File.open(path)
        data = XmlSimple.xml_in(f.read)

        blog_title = data['channel'][0]["title"][0]
        blog_link = data['channel'][0]["link"][0]

        # Create categories
        data['channel'][0]["category"].each do |c|
          Blogr::Category.create title: c["cat_name"][0]
        end

        # Create posts
        data['channel'][0]["item"].each do |p|
          pub = p["status"][0] == "publish" ? true : false
          is_post = p["post_type"][0] == "post" ? true : false
          permalink = p["post_name"][0]

          # Convert the WordPress encoded post content to Markdown
          content = ReverseMarkdown.parse(p["encoded"][0])
          
          # If the post is a post then create it
          if is_post
            post = Blogr::Post.create title: p["title"][0], content: content, permalink: permalink, published: pub, published_at: p["pubDate"][0]
            
            # Create the categories as tags for the moment
            p["category"].each do |c|
              post.tags.create name: c["content"]
            end

            puts ">  Imported post - #{post.title}"
          end
        end

        puts "Import Complete"

      else
        raise ImportError, "The Blogr importer couldn't file the file at #{path}"
      end
    end

  end
end
