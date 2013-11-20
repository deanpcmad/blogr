require 'test_helper'

module Blogr
  class SessionsControllerTest < ActionController::TestCase
    test "should get new" do
      get :new
      assert_response :success
    end

  end
end
