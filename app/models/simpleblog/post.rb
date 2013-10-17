module Simpleblog
  class Post < ActiveRecord::Base

    validates :title, uniqueness: true
    validates :content, :title, presence: true


  end
end
