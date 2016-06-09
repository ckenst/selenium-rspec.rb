require 'selenium-webdriver'

class DynamicLoading
	START_BUTTON  = { css: '#start button' }
  FINISH_TEXT   = { id: 'finish' }

	def initialize(driver)
		@driver = driver
	end

	def visit_example(example_number)
		@driver.get "http://the-internet.herokuapp.com/dynamic_loading/#{example_number}"
	end

	def start
		@driver.find_element(START_BUTTON).click
	end

	def finish_text_present?
		wait_for { is_displayed? FINISH_TEXT }
	end

	def is_displayed?(locator)
		@driver.find_element(locator).displayed?
	end

	def wait_for(timeout = 15)
		Selenium::WebDriver::Wait.new(:timeout => timeout).until { yield }
	end

end
