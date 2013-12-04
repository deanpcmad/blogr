require "ostruct"

module Blogr
  
  def self.config
    @config ||= Configuration.new
  end
  
  class ConfigurationError < StandardError; end
  
  class Configuration < OpenStruct

    def self.load(path)
      if File.exist?(path)
        require path
      else
        raise ConfigurationError, "Blogr configuration file not found at #{path}"
      end
    end

  end
end
