#encoding:utf-8
class LoginPage < LazymantestPage
	page_url "https://www.weixinwork.com/users/sign_in"
	text_field :username,:id=>'user_email'
	text_field :password,:id=>'user_password'
	button :submit,:name=>'commit'

	def login(username,userpassword)
		self.username=username
		self.password=userpassword
		self.submit
		p 'login>>>>>>>>>>>>>>>>>>>1'
		wait_for_ajax
		p 'login>>>>>>>>>>>>>>>>>>>2'
    	#退出向导
    	turn_to IndexPage
	end
	def logout 

	end
	def disable_cookie
	    self.browser.cookies.add "guide_home","excuted",:path => "/", :expires => 10.days.from_now
	    self.browser.cookies.add "guide_upload_file","excuted",:path => "/", :expires => 10.days.from_now
	  end
end