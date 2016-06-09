require 'selenium-webdriver'

class KeyPress

  def initialize(driver)
    @driver = driver
    @driver.get 'http://the-internet.herokuapp.com/key_presses'
  end

  def send_keys
    @driver.find_element(class: 'example').send_keys :down
  end

  def find_result
    @driver.find_element(id: 'result').text
  end
end
