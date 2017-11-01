require 'sauce_whisk'

ENV['base_url']			    ||= 'http://the-internet.herokuapp.com'
ENV['host']             ||= 'saucelabs'
ENV['operating_system'] ||= 'Windows 8.1'
ENV['browser']          ||= 'chrome'
ENV['browser_version']  ||= '43'
ENV['resolution']       ||= '1280x1024'
