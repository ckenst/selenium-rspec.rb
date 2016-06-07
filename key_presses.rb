require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

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

run do
  @driver.get 'http://the-internet.herokuapp.com/key_presses'
  @driver.find_element(class: 'example').send_keys :down
  expect(@driver.find_element(id: 'result').text).to eql ('You entered: DOWN')
end
