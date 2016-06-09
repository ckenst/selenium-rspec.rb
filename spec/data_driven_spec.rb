#this is an example of a data-driven test and uses data/user_data.csv
#from Elemental Selenium Tip #19: http://elementalselenium.com/tips/19-data-driven-testing

require_relative '../pages/data_driven'
require 'csv'

describe 'Login with users' do

  before(:each) do
    @driver       = Selenium::WebDriver.for :firefox
    @data_driven  = DataDriven.new(@driver)
  end

  after(:each) do
    @driver.quit
  end

  it 'from file' do #this whole section needs to be refactored out
    @data_driven.user_data.each do |user|
      @driver.find_element(id: 'username').send_keys user[:username]
      @driver.find_element(id: 'password').send_keys user[:password]
      @driver.find_element(id: 'login').submit
      begin
        expect(@data_driven.notification_text).to eql user[:notification_message]
      rescue Exception => e
        puts e.message
      end
    end
  end
end
