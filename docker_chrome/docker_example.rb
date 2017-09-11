require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  caps    = Selenium::WebDriver::Remote::Capabilities.send("chrome")
  # This url is the local access url of the docker container
  @driver = Selenium::WebDriver.for(:remote, url: "http://0.0.0.0:32768/wd/hub", desired_capabilities: caps)
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
  @driver.get 'http://www.kenst.com/about/'
  expect(@driver.title).to eql "About – Chris Kenst's Blog"
  @driver.save_screenshot('docker_image.png')
end
