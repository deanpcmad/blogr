module Blogr
  class Post < ActiveRecord::Base

    has_and_belongs_to_many :categories
    has_many :images
    accepts_nested_attributes_for :images

    before_validation {
      self.permalink = title.parameterize
    }

    validates :title, uniqueness: true
    validates :content, :title, presence: true
    # validates_inclusion_of :status, in: %w( draft public )

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
