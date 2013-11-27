require 'spec_helper'

module Blogr
  describe Post do

    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:title) }
    it { should ensure_inclusion_of(:status).in_array(['draft', 'public']) }
    it { should have_and_belong_to_many :categories }
    it { should have_many :images }

    context "draft post" do
      let(:post) { FactoryGirl.build :blogr_post }
      subject { post }

      its(:published?) { should be_false }
      its(:delayed?)   { should be_false }

    end


    context "public post" do
      let(:post) { FactoryGirl.build :blogr_post_public }
      subject { post }

      its(:published?) { should be_true }
      its(:delayed?)   { should be_false }

    end


    context "public post delayed" do
      let(:post) { FactoryGirl.build :blogr_post_public_delayed }
      subject { post }

      its(:published?) { should be_false }
      its(:delayed?)   { should be_true }
    end



    describe "scopes" do
      before :each do
        FactoryGirl.create :blogr_post
        FactoryGirl.create :blogr_post_public
        FactoryGirl.create :blogr_post_public_delayed
      end

      it ".published" do
        posts = Post.published
        expect(posts.size).to be_equal 1
      end

      it ".draft" do
        posts = Post.drafts
        expect(posts.size).to be_equal 1
      end

      it ".delayed" do
        posts = Post.delayed
        expect(posts.size).to be_equal 1
      end

    end

  end
end
