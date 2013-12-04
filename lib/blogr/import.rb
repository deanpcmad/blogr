require "xmlsimple"

module Blogr
  
  class ImportError < StandardError; end
  
  class Import

    def self.wordpress(path)
      if File.exist?(path)
        # Open the file and parse it using XmlSimple
        f = File.open(path)
        data = XmlSimple.xml_in(f.read)

        blog_title = data['channel'][0]["title"]
        blog_link = data['channel'][0]["link"]

        
      else
        raise ImportError, "The Blogr importer couldn't file the file at #{path}"
      end
    end

  end
end
