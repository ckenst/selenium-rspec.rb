#downloading a file without a browser

require_relative '../pages/download'
require_relative 'spec_helper'
require 'rest-client'

describe 'Download File' do

  before(:each) do
    @download = DropDown.new(@driver)
  end

  it 'works' do
    @driver.get 'http://the-internet.herokuapp.com/download'
    link = @driver.find_element(css: '.example a').attribute('href')
    response = RestClient.head link
    expect(response.headers[:content_type]).to eql('application/octet-stream')
    expect(response.headers[:content_length].to_i).to be > 0
  end

  it "in a secure way" do #this test fails
    @driver.get 'http://admin:admin@the-internet.herokuapp.com/download_secure'
    cookie = @driver.manage.cookie_named 'rack.session'
    links = @driver.find_element(css: '.example a')
    links.map! { |link| link.attribute('href') } #method missing / undefined for .map!
    links.each do |link|
      response = RestClient.head link, cookie: { cookie[:name] => cookie[:value] }
      expect(response.headers[:content_type]).to eql(@download.content_type(link)) #this part fails. doesn't get image/jpeg
      expect(response.headers[:content_length].to_i).to be > 0
    end

  end

end
