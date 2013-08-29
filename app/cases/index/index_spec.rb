#encoding:utf-8
require File.expand_path 'app/cases/spec_helper'

describe '测试首页',:index  do 
	before :all do
		@message = test_data "message"
		@content = @message['content']
		@index_page=login_to_index
	end
	describe "发送不同类型的消息" do
		before :all do 
			p @content
		end
		context '测试普通消息' do
			it '测试发布消息' do				
				p "success"
				#@index_page
			end
		end
	end
end