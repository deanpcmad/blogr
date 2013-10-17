require 'spec_helper'

module Simpleshop

  describe 'Posts' do

    context 'creating posts' do

      it 'creating' do
        visit '/simpleblog/posts'
        click_link 'Create new'

        fill_in 'Title', with: 'Some Good Content'
        fill_in 'Content', with: 'Here you post'

        click_button 'Submit'

        expect(page.find('h2')).to have_content 'Some Good Content'
      end

    end

  end

end
