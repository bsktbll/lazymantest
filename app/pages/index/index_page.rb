#encoding: utf-8
class IndexPage < LazymantestPage
  button(:skip_guide,:class=>"bootstro-finish-btn")
  #获取第一个thread对象，用于在这个thread内部进行一些操作
  def first_thread
    get_element(:div,"thread-content-wrap")
  end

  def skip_guide
    begin
      execute_script %Q{
        if(App.Guide){
          App.Guide.start=function(){}
        }
      }
      # self.skip_guide_element.when_visible(5).click
      # rescue Watir::Wait::TimeoutError
      self.wait_for_ajax
    end
  end
  def active_nav name
    self.execute_script %Q{
      // $(".apps-more .dropdown").addClass("open");
      $("li[data-mmodule-name='#{name}']").trigger("click");
    }
  end
  def logout
    self.execute_script %Q{
      $(".topbar-menus .dropdown-menu>li>a:last").trigger("click")
    }
    wait_until_include "登录"
  end




end
