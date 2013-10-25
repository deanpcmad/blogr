module Simpleblog
  class Post < ActiveRecord::Base

    has_and_belongs_to_many :categories
    has_many :images
    accepts_nested_attributes_for :images

    validates :title, uniqueness: true
    validates :content, :title, presence: true
    validates_inclusion_of :status, in: %w( draft public )

    scope :published, -> { where "status = 'public' AND published_at <= '#{Time.now}'" }
    scope :drafts,    -> { where status: :draft }
    scope :delayed,   -> { where "status = 'public' AND published_at >= '#{Time.now}'" }

    def published?
      status == 'public' && published_at.past?
    end

    def delayed?
      status == 'public' && published_at.future?
    end

    def date_parsed
      published_at.present? ? published_at.strftime("%d %B %Y") : ""
    end

  end
end
