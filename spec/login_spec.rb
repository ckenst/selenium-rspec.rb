#Logging into The Internet app both successfully and un-successfully. Asserting it worked

require_relative '../pages/login'
#require_relative 'spec_helper'

describe 'Login' do

	before(:each) do
    @driver = Selenium::WebDriver.for :chrome
		@login = Login.new(@driver)
	end

	after(:each) do
    @driver.quit
  end

	it 'succeeded' do
		@login.with('tomsmith', 'SuperSecretPassword!')
		expect(@login.success_message_present?).to eql true
	end

	it 'failed' do
		@login.with('asdf', 'asdf')
		expect(@login.failure_message_present?).to eql true
	end
end
