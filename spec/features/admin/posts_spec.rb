require 'spec_helper'

module Blogr

  describe 'Posts' do

    before :each  do
      visit '/blogr/admin/posts'

      FactoryGirl.create :blogr_category
      FactoryGirl.create :blogr_post

    end

    context 'creating posts' do
      before do
        click_link 'Create new'

        fill_in 'Title', with: 'Some Good Content here to ready'
        fill_in 'Content', with: 'Here you post'
        fill_in 'Excerpt', with: 'Excerpt Content'

        click_button 'Submit'
      end

      it { expect(page.find('h2')).to have_content 'Some Good Content' }
      it { expect(page).to have_content 'Excerpt Content' }

    end

    context 'creating w/categories' do
      before do
        click_link 'Create new'

        fill_in 'Title', with: 'Some Good Content'
        fill_in 'Content', with: 'Here you post'

        check 'Sports'

        click_button 'Submit'
      end

      it { expect(Post.last.categories).to_not be_empty }

    end


    context 'editing posts' do
      it 'adding category' do
        visit '/blogr/admin/posts'
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
        visit '/blogr/admin/posts'
        click_link 'Destroy'
        expect(page).to_not have_content "Blog's title"
      end
    end

  end

end
