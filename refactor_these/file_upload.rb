#this is an example of a file upload test
#from Elemental Selenium Tip #1: http://elementalselenium.com/tips/1-upload-a-file
#not sure why the app fails to upload

require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  @driver = Selenium::WebDriver.for :chrome
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
  filename = 'license.txt'
  file = File.join(Dir.pwd, filename)

  @driver.get 'http://the-internet.herokuapp.com/upload'
  @driver.find_element(id: 'file-upload').send_keys file
  @driver.find_element(id: 'file-submit').click

  Selenium::WebDriver::Wait.new(timeout: 8).until do
    @driver.find_element(id: 'uploaded-files')
  end

  uploaded_file = @driver.find_element(id: 'uploaded-files').text
  expect(uploaded_file).to eql filename
end
