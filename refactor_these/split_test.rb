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

# This reads in the heading text of the page, determines if it is a variant or control, 
# sets a cookie to opt out entirely and then refreshes the page to see if that opt-out works

run do
	@driver.get 'http://the-internet.herokuapp.com/abtest'
	heading_text = @driver.find_element(css: 'h3').text
	expect(['A/B Test Variation 1', 'A/B Test Control'].include? heading_text).to eql true
	@driver.manage.add_cookie(name: 'optimizelyOptOut', value: 'true')
	@driver.navigate.refresh
	heading_text = @driver.find_element(css: 'h3').text
	expect(heading_text).to eql 'No A/B Test'
end