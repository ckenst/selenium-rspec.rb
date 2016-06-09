# Selenium Examples

###About:

These examples are for building GUI acceptance tests (checks) using Selenium WebDriver in Ruby using RSpec. Many of these examples are trials before I implement them at work. The challenge with any automation is always about how to reveal new and interesting information through tests in a computer aided fashion.

Many of these ideas come from the [Elemental Selenium](http://elementalselenium.com/) tips site, [Selenium Bootcamp](https://saucelabs.com/resources/selenium-bootcamp/) and Selenium Bootcamp PDF (found in my repository). Other examples came from around the web or through [The Selenium GuideBook](https://seleniumguidebook.com/) (which I highly recommend).


###To Use Remotely:
(Must have a SauceLabs account:)

1. Update config_cloud.rb file for
  - SAUCE_USERNAME
  - SAUCE_ACCESS_KEY
2. Run the tests at command line ```rspec -r ./config_cloud.rb```

###To Use Locally:

1. Switch to the /spec/ folder
2. Run the tests at command line ```rspec <specname>.rb```

###To Do:
1. Abstract out tests:
  - add spec files to /spec folder
  - add page object files to /pages folder
  - do this for each test
3. Add config file and configuration options for running sauce labs / locally -> In Progress
4. Add spec_helper?
