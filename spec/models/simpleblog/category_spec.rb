require 'spec_helper'

module Blogr
  describe Category do
    it { should validate_uniqueness_of :title }
    it { should validate_presence_of :title }
    it { should have_and_belong_to_many :posts }
  end
end
