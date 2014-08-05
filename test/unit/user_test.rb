require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:user_friendships)
  should have_many(:friends)

  test "a user should enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unqie profile name" do
    user = User.new
    user.profile_name = users(:iyad).profile_name

    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
    user = User.new(first_name: 'Lynda', last_name: '.com', email: 'lynda@ly1.com')
    user.password = 'password'

    user.profile_name = "My Profile Name Space"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly")
  end

  test "a user can a correctly formatted profile name" do
    user = User.new(first_name: 'Lynda', last_name: '.com', email: 'lynda@lynd2.com')
    user.password = 'password'

    user.profile_name = "amazin_1"

    assert user.valid?
  end

  test "that no error is raised when tryin to access a friend list" do
    assert_nothing_raised do
      users(:iyad).friends
    end
  end

  test "that creating friendships on a user works" do
    users(:iyad).friends << users(:mike)
    users(:iyad).friends.reload
    assert users(:iyad).friends.include?(users(:mike))
  end


end
