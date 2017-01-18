# split_test2.rb

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

# This test loads the homepage, adds the opt-out cookie and then tries loading the A/B test page, 
# asserting the variant we are on is the original / opt-out page

run do
	@driver.get 'http://the-internet.herokuapp.com'
	@driver.manage.add_cookie(name: 'optimizelyOptOut', value: 'true')
	@driver.get 'http://the-internet.herokuapp.com/abtest'
	expect(@driver.find_element(css: 'h3').text).to eql 'No A/B Test'
end