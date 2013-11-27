require "spec_helper"

describe Blogr::User do
  
  it "has a valid factory" do
  	FactoryGirl.create(:blogr_user).should be_valid
  end

  it "is invalid without an email" do
  	FactoryGirl.build(:blogr_user, email: nil).should_not be_valid
  end

  it "is invalid without a password" do
  	FactoryGirl.build(:blogr_user, password: nil).should_not be_valid
  end

  it "is invalid where the password and password_confirmation don't match" do
  	FactoryGirl.build(:blogr_user, password: "hello123", password_confirmation: "pass123").should_not be_valid
  end

  it "is invalid without a first_name" do
    FactoryGirl.build(:blogr_user, first_name: nil).should_not be_valid
  end

  it "is invalid without a last_name" do
    FactoryGirl.build(:blogr_user, last_name: nil).should_not be_valid
  end

  it "is invalid without a username" do
    FactoryGirl.build(:blogr_user, username: nil).should_not be_valid
  end

end