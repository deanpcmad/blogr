require 'spec_helper'

module Simpleblog

  describe 'Posts' do

    before :each  do
      visit '/simpleblog/posts'

      FactoryGirl.create :simpleblog_category
      FactoryGirl.create :simpleblog_post

    end

    context 'creating posts' do
      it 'creating simple' do
        click_link 'Create new'

        fill_in 'Title', with: 'Some Good Content'
        fill_in 'Content', with: 'Here you post'

        click_button 'Submit'

        expect(page.find('h2')).to have_content 'Some Good Content'
      end


      it "creating w/ categories" do
        click_link 'Create new'

        fill_in 'Title', with: 'Some Good Content'
        fill_in 'Content', with: 'Here you post'

        check 'Sports'

        click_button 'Submit'

        expect(Post.last.categories).to_not be_empty

      end
    end


    context 'editing posts' do
      it 'adding category' do
        visit '/simpleblog/posts'
        click_link 'Edit'
        fill_in 'Title', with: 'Some Good Content'
        fill_in 'Content', with: 'Here you post'

        check 'Sports'

        click_button 'Submit'

        expect(Post.last.categories).to_not be_empty
      end
    end


    context 'deleting posts' do
      it 'deleting' do
        visit '/simpleblog/posts'
        click_link 'Destroy'
        expect(page).to_not have_content "Blog's title"
      end
    end

  end

end
