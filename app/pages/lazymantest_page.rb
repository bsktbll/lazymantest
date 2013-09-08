#encoding: utf-8

class LazymantestPage < Lazyman::Page
	include Lazyman::Helpers
	def random_test_data (seed="")
		seed+Time.now.to_i.to_s
	end

	def click_link link_text ,wait=true
		execute_script %Q{
			$(window).scrollTop(0);
			// $('a:contains("#{link_text}")').trigger("click")
			//$('a:contains("#{link_text}")').get(0).click
		}
		self.link_element(:text=>link_text,:index=>0).when_visible.click
		self.wait_for_ajax if wait
		#增加页面渲染时间
		sleep 0.3
	end
	def wait_until_include (*msgs)
		wait_until  do
			self.include? msgs
		end
	end

	def select_user selector,user_name=nil

		self.execute_script %Q{
			var $el=$("#{selector}");
			$el.focus().trigger("click");
		}
		element=self.execute_script %Q{
			return	$("#{selector}").get(0)
		}
		unless user_name.nil? then
		element.send_keys user_name.to_s 
		wait_for_ajax
		end
		self.execute_script %Q{
			$.timeout(function(){

				if($("#at-view .item.cur").length){
					$("#at-view .item.cur").trigger("click");
				}else{
					$("#at-view .item:last").trigger("click");
				}
				if( $el.is(":visible")){
					$el.blur();
				}
			},1000)
		}
		sleep 1.5
	end

	def data_driven hash,wait_for_ajax=true
		puts hash
		raise ArgumentError unless hash.is_a?(Hash)
		hash.each do |mtd, data|
			m_with_eql = (mtd.to_s + '=').to_sym
			if respond_to?(m_with_eql)
				#self.send(m_with_eql, data)
				eval "self.#{m_with_eql.to_s}(data)"
			elsif respond_to?(mtd.to_sym)
				if(data.nil?||data.empty?) then
					self.send(mtd.to_sym)
				elsif data=="click" then
					self.send(mtd.to_sym).send(data.to_sym)
				else
					self.send(mtd.to_sym,data.to_sym)
				end
			end #if
		end #each
		yield(self) if block_given?
		self.wait_for_ajax if wait_for_ajax
	end
end
