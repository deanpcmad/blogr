include Blogr::PostsHelper

module Blogr
  class Post < ActiveRecord::Base

    belongs_to :category, class_name: "Blogr::Category"
    belongs_to :user, class_name: "Blogr::User"
    has_many :taggings, class_name: "Blogr::Tagging"
    has_many :tags, through: :taggings, class_name: "Blogr::Tag"
    has_many :comments, class_name: "Blogr::Comment"

    before_validation { self.permalink = title.parameterize if self.permalink.nil? }

    validates_uniqueness_of :title, :permalink
    validates_presence_of :title, :permalink, :content, :user_id

    scope :published, -> { where "published = ? AND published_at <= ?", true, Time.now.to_s }
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
      Blogr::Tag.select(
        "#{Blogr::Tag.table_name}.*, COUNT(#{Blogr::Tagging.table_name}.tag_id) AS count"
      ).joins(:taggings).group("#{Blogr::Tagging.table_name}.tag_id")
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
