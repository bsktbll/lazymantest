module PageObject
  module Elements
    #
    # Contains functionality that is common across all elements.
    #
    # @see PageObject::Platforms::WatirWebDriver::Element for the Watir version of all common methods
    # @see PageObject::Platforms::SeleniumWebDriver::Element for the Selenium version of all common methods
    #
    class Element
      include Lazyman::Helpers
      def ajax_click
        self.click
        self.wait_for_ajax  
      end
      def wait_for_ajax(timeout = 30, message = nil)
        puts 'wait_for_ajax>>>>>>>>>>>0>>>>>>>>>>>>>>'
        end_time = ::Time.now + timeout
        until ::Time.now > end_time
          puts 'wait_for_ajax>>>>>>>>>>>1>>>>>>>>>>>>>>'
        return if $navi.browser.execute_script(::PageObject::JavascriptFrameworkFacade.pending_requests) == 0
        puts 'wait_for_ajax>>>>>>>>>>>2>>>>>>>>>>>>>>'
        sleep 0.5
      end
      message = "Timed out waiting for ajax requests to complete" unless message
      raise message
    end
  end
end
end