#encoding:utf-8
require File.expand_path 'app/cases/spec_helper'
describe 'login to weixinwork',:login do
	
	it 'should login to weixinwork' do 
		puts $navi.public_methods
		login_page=$navi.goto_login_page    
		
		login_page.login 't1@t20.com','111111'
		
	end
end
#git