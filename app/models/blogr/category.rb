module Blogr
  class Category < ActiveRecord::Base

    has_many :posts

    validates :title, uniqueness: true
    validates :title, presence: true
  end
end
