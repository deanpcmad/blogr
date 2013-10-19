module Simpleblog
  class Post < ActiveRecord::Base

    has_and_belongs_to_many :categories
    has_many :images
    accepts_nested_attributes_for :images

    validates :title, uniqueness: true
    validates :content, :title, presence: true
    validates_inclusion_of :status, in: %w( draft public )


  end
end
