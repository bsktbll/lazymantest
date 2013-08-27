#encoding:utf-8
require File.expand_path 'app/cases/spec_helper'
describe 'login to weixinwork',:login do
	before :all do 
		@logindata = test_data "login"
		@username=@logindata["user1"]
		@userpassword=@logindata["password"]
		p 
	end
	it 'should login to weixinwork' do 
		puts $navi.public_methods
		login_page=$navi.goto_login_page    
		
		login_page.login @username,@userpassword
		
	end
end
#git