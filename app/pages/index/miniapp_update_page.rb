#encoding: utf-8
class MiniappUpdatePage < MiniappBasePage

  div(:message_input_fake,:class=>"message-input-fake")
  text_field(:update_input,:xpath=>"//div[@class='feed-header']//div[contains(@class,'update-input-wrap')]//textarea")
  text_field :reply_input,:xpath=>"//div[@class='threads-container']//textarea[contains(@class,'message-input')]",:index=>0
  link :submit_reply,:xpath=>"//div[@class='threads-container']//a[contains(@class,'action-submit')]",:index=>0
end
