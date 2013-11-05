include Blogr::PostsHelper

module Blogr
  class Post < ActiveRecord::Base

    belongs_to :category
    has_many :images
    accepts_nested_attributes_for :images

    before_validation { self.permalink = title.parameterize if self.permalink.nil? }

    validates_uniqueness_of :title, :permalink
    validates_presence_of :title, :permalink, :content

    scope :published, -> { where "published = true AND published_at <= '#{Time.now}'" }
    scope :draft,    -> { where published: false }

    def to_param
      permalink
    end

    def date_parsed
      published && published_at.present? ? published_at.strftime("%d %B %Y") : ""
    end

    def content_rendered
      markdown(content).html_safe
    end

  end
end
