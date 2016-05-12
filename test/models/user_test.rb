require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "valid user under normal circumstances" do
    @user = User.new(email: "example@example.com",
                      password: "123test",
                      password_confirmation: "123test",
                      first_name: "Kyle",
                      last_name: "Laughlin")
    assert(@user.valid?, "Should be valid under normal circumstances")
   end

   test "user password must have be at least three characters long" do
     @user = User.new(email: "example@example.com",
                       password: "123test",
                       password_confirmation: "123test",
                       first_name: "Kyle",
                       last_name: "Laughlin")
    @user.password = "12"
    @user.password_confirmation = "12"
    refute(@user.valid?, "Should be invalid becuase the password
                          shorter than 3 characters")
   end

   test "user password and password_confirmation must match" do
     @user = User.new(email: "example@example.com",
                       password: "123test",
                       password_confirmation: "123test",
                       first_name: "Kyle",
                       last_name: "Laughlin")
    @user.password_confirmation = "123example"
    refute(@user.valid?, "Should be invalid becuase the password and
                          password_confirmation do not match")
   end

   test "email must be present to be valid" do
     @user = User.new(email: "example@example.com",
                       password: "123test",
                       password_confirmation: "123test",
                       first_name: "Kyle",
                       last_name: "Laughlin")
    @user.email = nil
    refute(@user.valid?, "Should be invalid becuase the email can not be nil")
   end

   test "email must be unique" do
     @user = User.new(email: "example@example.com",
                       password: "123test",
                       password_confirmation: "123test",
                       first_name: "Kyle",
                       last_name: "Laughlin")
    @user.save
    @user_two = User.new(email: "example@example.com",
                     password: "123example",
                     password_confirmation: "123example",
                     first_name: "Andrea",
                     last_name: "Dier")
    refute(@user_two.valid?, "Should be invalid becuase there is already a
                              user with the same email.")
   end

   test "first_name must be present to be valid" do
     @user = User.new(email: "example@example.com",
                       password: "123test",
                       password_confirmation: "123test",
                       first_name: "Kyle",
                       last_name: "Laughlin")
    @user.first_name = nil
    refute(@user.valid?, "Should be invalid becuase the first_name can not be nil")
   end

   test "last_name must be present to be valid" do
     @user = User.new(email: "example@example.com",
                       password: "123test",
                       password_confirmation: "123test",
                       first_name: "Kyle",
                       last_name: "Laughlin")
    @user.last_name = nil
    refute(@user.valid?, "Should be invalid becuase the last_name can not be nil")
   end
end
