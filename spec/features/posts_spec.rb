require 'spec_helper'

module Simpleblog

  describe 'Posts' do

    before :each  do
      visit '/simpleblog'

      FactoryGirl.create :simpleblog_category
      FactoryGirl.create :simpleblog_post_public, title: "Testing a post", content: "Test Content"
    end

    context 'create and view post' do
      it { expect(page).to have_content "Testing a post" }
      it { expect(page).to have_content "Test Content" }
    end

  end

end
