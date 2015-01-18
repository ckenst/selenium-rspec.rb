# filename: config_cloud.rb

ENV['host']             = 'saucelabs'
ENV['operating_system'] ||= 'Windows 8.1'
ENV['browser']          ||= 'CHROME'
ENV['browser_version']  ||= '38'
ENV['SAUCE_USERNAME']   ||= 'USERNAME'
ENV['SAUCE_ACCESS_KEY'] ||= 'UNIQUE_ACCESS_KEY'
