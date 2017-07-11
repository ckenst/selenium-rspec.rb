# Selenium Examples

### About:

These examples are for building GUI acceptance tests using Selenium WebDriver (Selenium) in Ruby using an open source BDD framework called [RSpec](http://rspec.info/). (Sometimes these GUI tests are called integration tests or end to end tests.)

Many of these test ideas come from the [Elemental Selenium](http://elementalselenium.com/) tips site and elsewhere on the web as separate bits of example code. Then they get refactored into a single test suite with separate page objects as it presents a cleaner and more realistic view of how you might structure a similar test suite.

_The challenge (and fun) with any automation is always about how to reveal new and interesting information through tests in a computer aided fashion._

## To Install:

1. Download or clone the repo
2. Run `bundle install` to install all of the required gems

### To run Locally:

1. Switch to the /spec/ folder
2. Run the tests at command line ```rspec <specname>.rb```

### To run Remotely:
(Must have a SauceLabs account:)

1. Update config_cloud.rb file for
  - SAUCE_USERNAME
  - SAUCE_ACCESS_KEY
2. Run the tests at command line ```rspec -r ./config_cloud.rb```

---

### To Do:
1. Move more of the tests into page objects
   - Create a base page objects as necessary
   - Then make sure tests appropriately reference them
2. Add config file and configuration options for running sauce labs / locally
3. Add Vendor files for storing ChromeDriver and GeckoDriver.
   - Add paths to spec_helper.
4. Create a rakefile
   - I think this is done but tests need to reference it
5. Add a headless chrome example
6. Refactor tests to start referencing base page object methods
   - Remove references to initialize method
