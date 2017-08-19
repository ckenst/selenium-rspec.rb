# filename: login_spec.rb
# require 'selenium-webdriver'
require 'eyes_selenium'

ENV['browser']          ||= 'internet_explorer'
ENV['browser_version']  ||= '9'
ENV['platform']         ||= 'Windows 7'
ENV['viewport_width']   ||= '1000'
ENV['viewport_height']  ||= '600'




describe 'Login' do
  before(:each) do |example|
    caps                      = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
    caps.version              = ENV['browser_version']
    caps.platform             = ENV['platform']
    caps[:name]               = example.metadata[:full_description]
    caps['screen-resolution'] = '1280x1024'
    @browser                  = Selenium::WebDriver.for(
      :remote,
      url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
      desired_capabilities: caps)
    @eyes                     = Applitools::Eyes.new
    @eyes.api_key             = ENV['APPLITOOLS_API_KEY']
    @driver                   = @eyes.open(
      app_name:   'the-internet',
      test_name:  example.metadata[:full_description],
      viewport_size:  { width: ENV['viewport_width'].to_i,
                        height: ENV['viewport_height'].to_i },
      driver:           @browser)
    end

  after(:each) do
    @eyes.close
    @browser.quit
  end

  it 'succeeded' do
    @driver.get 'http://the-internet.herokuapp.com/login'
    @eyes.check_window('Login Page')
    @driver.find_element(id: 'username').send_keys('tomsmith')
    @driver.find_element(id: 'password').send_keys('SuperSecretPassword!')
    @driver.find_element(id: 'login').submit
    @eyes.check_window('Logged In')
  end
end
