def login_to_index username=nil,password=nil

	if username.nil? then
		#默认登陆第一个测试用户
		data=test_data("login")
		username=data["user1"]
		password=data["password"]
	end

	login_page=$navi.goto_login_page
	p "==============1====================def login_to_index"
	login_page.disable_cookie
	p "==============2====================def login_to_index"
	index_page=login_page.login username,password
	#index_page.skip_guide
	p "====================================index_page.url=" + index_page.url
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
