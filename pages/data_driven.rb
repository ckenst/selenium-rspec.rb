require 'selenium-webdriver'

class DataDriven

  def initialize(driver)
    @driver = driver
    @driver.get 'http://the-internet.herokuapp.com/login'
  end

  def wait_for(timeout = 15)
  	Selenium::WebDriver::Wait.new(:timeout => timeout).until { yield }
  end

  def user_data
    user_data = CSV.read Dir.pwd + '/data/user_data.csv'
    descriptor = user_data.shift
    descriptor = descriptor.map { |key| key.to_sym }
    user_data.map { |user| Hash[ descriptor.zip(user) ] }
  end

  def notification_text
    wait_for(5) { @driver.find_element(class: 'flash').displayed? }
    @driver.find_element(class: 'flash').text.delete('^a-zA-z !.')
  end
end
