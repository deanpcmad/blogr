require 'spec_helper'

module Simpleblog

  describe 'Posts' do

    before  do
      visit '/simpleblog/posts'
    end

    context 'creating posts' do
      it 'creating' do
        click_link 'Create new'

        fill_in 'Title', with: 'Some Good Content'
        fill_in 'Content', with: 'Here you post'

        click_button 'Submit'

        expect(page.find('h2')).to have_content 'Some Good Content'
      end
    end


    context 'deleting posts' do

      before do
        FactoryGirl.create :simpleblog_post
      end

      it 'deleting' do
        visit '/simpleblog/posts'
        click_link 'Destroy'
        expect(page).to_not have_content "Blog's title"
      end
    end



  end

end
