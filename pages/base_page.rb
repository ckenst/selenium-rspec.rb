require 'selenium-webdriver'

class BasePage
  def initialize(driver)
    @driver = driver
  end

  def find(locator)
    @driver.find_element locator
  end

  def type(text, locator)
    find(locator).send_keys text
  end

  def click(locator)
    find(locator).click
  end
end
