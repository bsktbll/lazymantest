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

	end
end