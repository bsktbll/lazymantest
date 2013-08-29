def login_to_index username=nil,password=nil

	if username.nil? then
		#默认登陆第一个测试用户
		data=test_data("login")
		username=data["user"]
		password=data["password"]
	end
	login_page=$navi.goto_login_page
	login_page.disable_cookie
	index_page=login_page.login username,password
	index_page.skip_guide
	$base_url=index_page.url.split("#").first
	index_page
end
shared_examples 'login' do
	it 'should login' do
		data = test_data('login_user')
		user = data['demo']['name']
		password = data['demo']['password']
		
		login_page = $navi.goto_login_page
		my_view_page = login_page.login user, password
		my_view_page.report_issue?.should be_true
	end 
end 
