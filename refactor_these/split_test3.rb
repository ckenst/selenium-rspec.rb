# split_test3.rb

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

# This test loads the ab test page but opts out by appending to the url. Then dismisses the javascript alert and 
# asserts we are on the correct page / variant. 

run do
	@driver.get 'http://the-internet.herokuapp.com/abtest?optimizely_opt_out=true'
	@driver.switch_to.alert.dismiss
	expect(@driver.find_element(css: 'h3').text).to eql 'No A/B Test'
end