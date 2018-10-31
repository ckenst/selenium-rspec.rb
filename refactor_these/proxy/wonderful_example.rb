require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  # works to test locally in a docker container
  caps    = Selenium::WebDriver::Remote::Capabilities.send("chrome")
  @driver = Selenium::WebDriver.for(:remote, url: "http://0.0.0.0:4444/wd/hub", desired_capabilities: caps)
  #@driver.proxy = Selenium::Proxy.new(:http => 'brussels.wonderproxy.com')

  # try this in firefox
  # or try this in phantomjs and see if the existing info help

  # we want to target: brussels.wonderproxy.com
  # proxy-auth =
  # do we need any credentials or api keys?

  # this throws an error because my system doesn't know what Proxy.new is
  # client = Selenium::WebDriver::Remote::Http::Default.new
  # client.proxy = Selenium::Proxy.new(http: "brussels.wonderproxy.com")
  # driver = Selenium::WebDriver.for :remote, http_client: client

  # Not sure what this yet does
  # caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "--disable-web-security" ]})
  # driver = Selenium::WebDriver.for :remote, url: 'http://localhost:4444/wd/hub' desired_capabilities: caps

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
  @driver.save_screenshot('geo.png')
end
