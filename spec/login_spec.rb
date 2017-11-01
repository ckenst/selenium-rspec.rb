#Logging into The Internet app both successfully and un-successfully. Asserting it worked

require_relative '../pages/login'
require_relative 'spec_helper'
require 'dotenv/load'

describe 'Login' do

	before(:each) do
		@login = Login.new(@driver)
	end

	it 'succeeded' do
		@login.with(ENV["USERNAME"],ENV["PASSWORD"]) #these are specified in a local .ENV file
		expect(@login.success_message_present?).to eql true
	end

	it 'failed' do
		@login.with('asdf', 'asdf')
		expect(@login.failure_message_present?).to eql true
	end
end
