require "rspec/expectations"
RSpec::Matchers.define :include_test_datas do |*expected|
	match do |actual|
		expected=expected.flatten
		result=true
		expected.each do|msg|
			p ">>>>>include_test_datas>>>>>>>>>>>>>>>>"+msg if !msg.nil?
			result= result&&(actual.text.include? msg.to_s) if !msg.nil?&&!(/^[\u4e00-\u9fa5]/.match msg.to_s).nil?
		end
		result
	end
	# failure_message_for_should do |actual|
	# 	"expected that #{actual} would be a multiple of #{expected}"
	# end
end