require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  caps    = Selenium::WebDriver::Remote::Capabilities.send("chrome")
  @driver = Selenium::WebDriver.for(:remote, url: "http://0.0.0.0:32768/wd/hub", desired_capabilities: caps)

  # client = Selenium::WebDriver::Remote::Http::Default.new
  # client.proxy = Selenium::Proxy.new(http: "brussels.wonderproxy.com")
  # driver = Selenium::WebDriver.for :remote, http_client: client

  # we want to target: brussels.wonderproxy.com
  # @driver.proxy = Selenium::Proxy.new(:http => "proxy.org:8080")
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
  @driver.get 'https://wondernetwork.com/geotest'
  expect(@driver.title).to eql "Geotest - WonderNetwork"
  # @driver.save_screenshot('docker_image.png')
end
