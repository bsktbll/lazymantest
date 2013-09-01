module Lazyman
	module Helpers
		def get_element tag_name,class_name,index=0
			method_alias={:a=>"link",:li=>"list_item",:input=>"text_field",:textarea=>"text_area"}
			method_name=  (method_alias.has_key? tag_name)? method_alias[tag_name] : tag_name.to_s
			self.send(method_name+"_element",:xpath=>".//#{tag_name.to_s}[contains(@class,'#{class_name}')]",:index=>index)
		end

		def include? *args
			args=args.flatten
			result=true
			args.each do|msg|
				result= result&&(self.text.include? msg) if !msg.nil?&&!(/^[\u4e00-\u9fa5]/.match msg).nil?
			end
			result
		end
	end
end