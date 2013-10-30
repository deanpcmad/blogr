module Blogr
  class Category < ActiveRecord::Base

    has_and_belongs_to_many :posts

    validates :title, uniqueness: true
    validates :title, presence: true
  end
end
