require 'selenium-webdriver'

RSpec.configure do |config|

	config.before(:each) do |example|
		case ENV['host']
		when 'saucelabs'
			caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
			caps.version 							= ENV['browser_version']
			caps.platform 						= ENV['operating_system']
			caps["screenResolution"] 	= ENV['resolution']
			caps[:name] 							= example.metadata[:full_description]

  		@driver = Selenium::WebDriver.for(
  			:remote,
  			url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
  			desired_capabilities: caps)
  	else
			case ENV['browser']
      when 'firefox'
        geckodriver = File.join(Dir.pwd, 'vendor', 'geckodriver')
        @driver = Selenium::WebDriver.for :firefox, driver_path: geckodriver
      when 'chrome'
        chromedriver = File.join(Dir.pwd, 'vendor', 'chromedriver')
        @driver = Selenium::WebDriver.for :chrome, driver_path: chromedriver
			end
		end
	end

	config.after(:each) do |example|
		begin
      if ENV['host'] == 'saucelabs'
        if example.exception.nil?
          SauceWhisk::Jobs.pass_job @driver.session_id
        else
          SauceWhisk::Jobs.fail_job @driver.session_id
          raise "Watch a video of the test at https://saucelabs.com/tests/#{@driver.session_id}"
        end
      end
    ensure
      @driver.quit
		end
	end
end
