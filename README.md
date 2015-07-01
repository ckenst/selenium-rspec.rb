# Selenium Bootcamp


###About:

Using both the [online](https://saucelabs.com/resources/selenium-bootcamp/) and PDF (found in my repository) versions of this bootcamp, I walked through the instructions and it's examples to get a feel for building a basic set of GUI acceptance tests (checks) in Ruby using RSpec.

Both versions written by Dave Haeffner and provided by [Sauce Labs](http://www.saucelabs.com).
  - I highly recommend taking the bootcamp
  - Then sign up for his mailing list at [Elemental Selenium](http://elementalselenium.com/)

##To Use Remotely:
(Must have a SauceLabs account:)

1. Update config_cloud.rb file for
  - SAUCE_USERNAME
  - SAUCE_ACCESS_KEY
2. Run the tests at command line ```rspec -r ./config_cloud.rb```

##To Use Locally:

1. Switch to the /spec/ folder
2. Run the tests at command line ```rspec <specname>.rb```
