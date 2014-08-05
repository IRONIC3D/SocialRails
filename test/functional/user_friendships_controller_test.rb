require 'test_helper'

class UserFriendshipsControllerTest < ActionController::TestCase
  context "#new" do
    context "when not logged in" do
      should "redirec to the login page" do
        get :new
        assert_response :redirect
      end
    end

    context "when logged in" do
      setup do
        sign_in users(:iyad)
      end

      should "get new and return success" do
        get :new
        assert_response :success
      end

      should "should a flash error if the friend_id params is missing" do
        get :new, {}
        assert_equal "Friend required", flash[:error]
      end

      should "display the friend's name" do
        get :new, friend_id: users(:mike)
        assert_match /#{users(:mike).full_name}/, response.body
      end

      should "assign a new user friendship" do
        get :new, friend_id: users(:mike)
        assert assigns(:user_friendship)
      end

      should "assign a new user friendship to the correct friend" do
        get :new, friend_id: users(:mike)
        assert_equal users(:mike), assigns(:user_friendship).friend
      end

      should "assign a new user friendship to the currently logged in user" do
        get :new, friend_id: users(:mike).id
        assert_equal users(:iyad), assigns(:user_friendship).user
      end

      should "return a 404 status if no friend is found" do
        get :new, friend_id: 'invalid'
        assert_response :not_found
      end

      should "ask if you really want to friend a user" do
        get :new, friend_id: users(:mike)
        assert_match /Do you really want to friend #{users(:mike).full_name}?/, response.body
      end
    end
  end
end
