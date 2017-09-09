require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
   get login_path
   assert_template 'session/new'
   post login_path, params: {sessions: {email: "", password: ""}}
   assert_template 'sessions/new'
   assert_not flash.empty?
   get root_path
   assert flash.empty?
   delete logout_path
   assert_not is_logged_in?
 end
  
end
