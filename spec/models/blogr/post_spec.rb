require "spec_helper"

describe Blogr::Post do
  
  it "has a valid factory" do
  	FactoryGirl.create(:blogr_post).should be_valid
  end

  it "is invalid without a title" do
  	FactoryGirl.build(:blogr_post, title: nil).should_not be_valid
  end

  it "is invalid without content" do
  	FactoryGirl.build(:blogr_post, content: nil).should_not be_valid
  end

  it "returns the title" do
  	post = FactoryGirl.build(:blogr_post, title: "Hello World")
  	post.title.should == "Hello World"
  end

  it "returns the content" do
  	post = FactoryGirl.build(:blogr_post, content: "Hello World, my name is Dean")
  	post.content.should == "Hello World, my name is Dean"
  end

end