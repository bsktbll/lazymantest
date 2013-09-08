#encoding:utf-8
require File.expand_path 'app/cases/spec_helper'

describe '测试首页',:index  do 
	before :all do
		@message = test_data "message"		
		@index_page= login_to_index		
	end
	describe "发送不同类型的消息" do
		before :all do 
					
		end
		context '测试普通消息' do
			before :all  do
				@update_data = @message['update']	
				@update_page=turn_to MiniappUpdatePage				
				@update_page.message_input_fake_element.when_visible
				@update_page.execute_script %Q{
					$(".message-input-fake").trigger("click");
					$(".feed-header").off(".dropUpload");
				}
				
			end
			it '测试发布update消息' do				
				submit_miniapp(@update_page,@update_data['create'])
			end
		end
	end
end