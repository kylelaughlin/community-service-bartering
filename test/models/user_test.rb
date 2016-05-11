require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "valid user under normal circumstances" do
    @user = User.new(email: "example@example.com",
                      password: "123test",
                      password_confirmation: "123test")
    assert(@user.valid?, "Should be valid under normal circumstances")
   end

   test "user password must have be at least three characters long" do
    @user = User.new(email: "example@example.com",
                      password: "123test",
                      password_confirmation: "123test")
    @user.password = "12"
    @user.password_confirmation = "12"
    refute(@user.valid?, "Should be invalid becuase the password
                          shorter than 3 characters")
   end

   test "user password and password_confirmation must match" do
     @user = User.new(email: "example@example.com",
                      password: "123test",
                      password_confirmation: "123test")
    @user.password_confirmation = "123example"
    refute(@user.valid?, "Should be invalid becuase the password and
                          password_confirmation do not match")
   end

   test "email must be present to be valid" do
     @user = User.new(email: "example@example.com",
                      password: "123test",
                      password_confirmation: "123test")
    @user.email = nil
    refute(@user.valid?, "Should be invalid becuase the email can not be nil")
   end

   test "email must be unique" do
     @user = User.new(email: "example@example.com",
                      password: "123test",
                      password_confirmation: "123test")
    @user.save
    @user_two = User.new(email: "example@example.com",
                     password: "123example",
                     password_confirmation: "123example")
    refute(@user_two.valid?, "Should be invalid becuase there is already a
                              user with the same email.")
   end
end
