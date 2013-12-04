require "spec_helper"

describe Blogr::Comment do
    
  it "has a valid factory" do
  	FactoryGirl.create(:blogr_comment).should be_valid
  end

  it "is invalid without a post" do
  	FactoryGirl.build(:blogr_comment, post_id: nil).should_not be_valid
  end

  it "is invalid without content" do
  	FactoryGirl.build(:blogr_comment, content: nil).should_not be_valid
  end

end