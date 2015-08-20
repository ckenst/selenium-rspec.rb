#filename: dropdown.rb

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
  @driver.get 'http://the-internet.herokuapp.com/dropdown'

  dropdown_list = @driver.find_element(id: 'dropdown')
  select_list = Selenium::WebDriver::Support::Select.new(dropdown_list)
  select_list.select_by(:text, 'Option 2')

  selected_option = select_list.selected_options[0].text
  expect(selected_option).to eql 'Option 2'
end
