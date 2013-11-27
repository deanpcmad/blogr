require "spec_helper"

describe Blogr::Category do
  
  it "has a valid factory" do
  	FactoryGirl.create(:blogr_category).should be_valid
  end

  it "is invalid without a title" do
  	FactoryGirl.build(:blogr_category, title: nil).should_not be_valid
  end

end