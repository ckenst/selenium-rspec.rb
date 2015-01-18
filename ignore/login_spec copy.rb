# filename: login_spec.rb
require 'selenium-webdriver'

describe 'Login' do
	before(:each) do
		@driver = Selenium::WebDriver.for :firefox
	end
	
	after(:each) do 
		@driver.quit
	end

	it 'succeeded' do
		@driver.get 'http://the-internet.herokuapp.com/login' 
		@driver.find_element(id: 'username').send_keys('tomsmith') 
		@driver.find_element(id: 'password').send_keys('SuperSecretPassword!') 
		@driver.find_element(id: 'login').submit
		@driver.find_element(css: '.flash.success').displayed?.should be_true #fail your assert to make sure it does what you want it to
	end
end