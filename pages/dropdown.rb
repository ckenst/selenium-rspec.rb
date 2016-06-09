require 'selenium-webdriver'

class DropDown

  def initialize(driver)
    @driver = driver
    @driver.get 'http://the-internet.herokuapp.com/dropdown'
  end
end
