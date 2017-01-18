# split_test.rb

require 'selenium-webdriver'
require 'rspec/expectations'
include ::RSpec::Matchers

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
	@driver.get 'http://the-internet.herokuapp.com/abtest'
	heading_text = @driver.find_element(css: 'h3').text
	expect(['A/B Test Variation 1', 'A/B Test Control'].include? heading_text).to eql true
	@driver.manage.add_cookie(name: 'optimizelyOptOut', value: 'true')
	@driver.navigate.refresh
	heading_text = @driver.find_element(css: 'h3').text
	expect(heading_text).to eql 'No A/B Test'
end