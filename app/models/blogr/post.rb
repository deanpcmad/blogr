include Blogr::PostsHelper

module Blogr
  class Post < ActiveRecord::Base

    belongs_to :category, class_name: "Blogr::Category"
    has_many :taggings, class_name: "Blogr::Tagging"
    has_many :tags, through: :taggings, class_name: "Blogr::Tag"
    has_many :comments, class_name: "Blogr::Comment"

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

    def self.tagged_with(name)
      Blogr::Tag.find_by_name!(name).posts
    end

    def self.tag_counts
      Blogr::Tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
    end

    def tag_list
      tags.map(&:name).join(", ")
    end

    def tag_list=(names)
      self.tags = names.split(",").map do |n|
        Blogr::Tag.where(name: n.strip).first_or_create!
      end
    end

  end
end
