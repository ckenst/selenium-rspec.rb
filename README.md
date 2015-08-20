# Selenium Examples

###About:

This repository contains some example automation using Ruby, RSpec and Selenium. Many of these ideas come from the [Elemental Selenium](http://elementalselenium.com/) tips site, [Selenium Bootcamp](https://saucelabs.com/resources/selenium-bootcamp/) and Selenium Bootcamp PDF (found in my repository). Other examples came from around the web or through [The Selenium GuideBook](https://seleniumguidebook.com/) (which I highly recommend).

These examples are for building GUI acceptance tests (checks) using Selenium WebDriver in Ruby using RSpec. Many of these examples are trials before I implement them at work.

The challenge with any automation is always about how to reveal new and interesting information through tests in a computer aided fashion. When the tests stop providing useful information they become essentially useless.

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
Integrate the following demos into page objects:
  1. Working with tables:
    - table_sort.rb
    - table_sort2.rb
  2. Working with Javascript alerts:
    - javascript_alerts.rb
  3. Selecting from a Dropdown List
    - dropdown.rb
    - dropdown2.rb
