require "spec_helper"

describe Blogr::Category do
  
  it "has a valid factory" do
  	FactoryGirl.create(:blogr_category).should be_valid
  end

  it "is invalid without a title" do
  	FactoryGirl.build(:blogr_category, title: nil).should_not be_valid
  end

  it "returns the title" do
  	category = FactoryGirl.build(:blogr_category, title: "Hello World")
  	category.title.should == "Hello World"
  end

  it "returns the description" do
  	category = FactoryGirl.build(:blogr_category, description: "Some cool stuff")
  	category.description.should == "Some cool stuff"
  end

end