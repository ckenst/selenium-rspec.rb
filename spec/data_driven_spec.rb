#this is an example of a data-driven test (self contained, no page object)
#from Elemental Selenium Tip #19: http://elementalselenium.com/tips/19-data-driven-testing

require 'selenium-webdriver'
require 'rspec/expectations'
require 'csv'
include ::RSpec::Matchers

def setup
  @driver = Selenium::WebDriver.for :firefox
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
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

run do
  user_data.each do |user|
    @driver.get 'http://the-internet.herokuapp.com/login'
    @driver.find_element(id: 'username').send_keys user[:username]
    @driver.find_element(id: 'password').send_keys user[:password]
    @driver.find_element(id: 'login').submit
    begin
      expect(notification_text).to eql user[:notification_message]
    rescue Exception => e
      puts e.message
    end
  end
end