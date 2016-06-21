# Selenium Examples

###About:

These examples are for building GUI acceptance tests using Selenium WebDriver (Selenium) in Ruby using an open source BDD framework called [RSpec](http://rspec.info/).

Many of these test ideas come from the [Elemental Selenium](http://elementalselenium.com/) tips site and elsewhere on the web as separate bits of example code. I'm taking the time to refactor them all into a single test suite because it presents a cleaner and more realistic view of how you might structure a similar test suite.

_The challenge (and fun) with any automation is always about how to reveal new and interesting information through tests in a computer aided fashion._

###To run Locally:

1. Switch to the /spec/ folder
2. Run the tests at command line ```rspec <specname>.rb```

###To run Remotely:
(Must have a SauceLabs account:)

1. Update config_cloud.rb file for
  - SAUCE_USERNAME
  - SAUCE_ACCESS_KEY
2. Run the tests at command line ```rspec -r ./config_cloud.rb```

---

###To Do:
1. Move more of the tests into page objects
  - Create a base page object as necessary
2. Add config file and configuration options for running sauce labs / locally -> In Progress
