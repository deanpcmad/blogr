module Blogr
  class Post < ActiveRecord::Base

    # has_and_belongs_to_many :categories
    has_many :images
    accepts_nested_attributes_for :images

    before_validation {
      self.permalink = title.parameterize
    }

    validates_uniqueness_of :title, :permalink
    validates_presence_of :title, :permalink, :content

    scope :published, -> { where "published = true AND published_at <= '#{Time.now}'" }
    # scope :drafts,    -> { where status: :draft }
    # scope :delayed,   -> { where "status = 'public' AND published_at >= '#{Time.now}'" }

    def to_param
      permalink
    end

    def date_parsed
      published && published_at.present? ? published_at.strftime("%d %B %Y") : ""
    end

  end
end
