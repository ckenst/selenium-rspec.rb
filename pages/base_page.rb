require 'selenium-webdriver'

class BasePage
  def initialize(driver)
    @driver = driver
  end
end
