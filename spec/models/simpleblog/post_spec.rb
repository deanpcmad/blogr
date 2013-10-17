require 'spec_helper'

module Simpleblog
  describe Post do

    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:title) }
    it { should validate_numericality_of(:user_id) }
    it { should ensure_inclusion_of(:status).in_array(['draft', 'public']) }
    it { should have_and_belong_to_many :categories }

  end
end
