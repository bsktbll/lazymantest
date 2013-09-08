#encoding: utf-8
class MiniappBasePage < LazymantestPage
  file_field(:file,:xpath=>"//div[@class='feed-header']//input[@class='file-upload-input']",:index=>0)
  link :modal_save,:xpath=>"//div[contains(@class,'modal')]//a[contains(@class,'action-save')]"
  def initialize_page
    # @test_data=test_data("miniapp")
  end
  def submit_post
    self.execute_script %Q{
      $(".feed-header .action-submit").removeClass("disabled").trigger("click");
    }
    # self.post
    #避免服务器端报错
    # sleep 2
  end
  #获取第一个thread对象，用于在这个thread内部进行一些操作
  def first_thread
    get_element(:div,"thread-content-wrap")
  end
  def show_modal class_name
    first_thread.get_element(:a,class_name).click
  end

  def upload_file file_name
    self.execute_script %Q{
      $('.js-selectfile-wrap').addClass('open');
      $('form.upload-hidden').removeClass('upload-hidden');
    }
    # $navi.browser.file_field(:class, 'file-upload-input').send_keys $test_data_path+"b.png"
    self.file= "#{$test_file_path}#{file_name}"
    wait_until do
      self.execute_script %Q{
        return $(".feed-header .action-submit").is(".btn-primary")
      }
    end
  end
  private

end
