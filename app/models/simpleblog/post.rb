module Simpleblog
  class Post < ActiveRecord::Base

    has_and_belongs_to_many :categories


    validates :title, uniqueness: true
    validates :content, :title, presence: true
    validates_inclusion_of :status, in: %w( draft public )


  end
end
