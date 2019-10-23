# Ruby Selenium Examples

### About:

These examples are for building GUI acceptance tests using Selenium WebDriver (Selenium) in Ruby using an open source BDD framework called [RSpec](http://rspec.info/). (Sometimes these GUI tests are called integration tests or end to end tests.)

Many of these test ideas come from the [Elemental Selenium](http://elementalselenium.com/) tips site and elsewhere on the web as separate bits of example code. Then they get refactored into a single test suite with separate page objects as it presents a cleaner and more realistic view of how you might structure a similar test suite.

_The challenge (and fun) with any automation is always about how to reveal new and interesting information through tests in a computer aided fashion._

## Container

1. Build it ``docker build -t selenium_rspec``
2. Run it ``docker run -ti selenium_rspec /bin/bash``

Can't do much from here at this point. TBD

## Installation:

1. Download or clone the repo
2. Run `bundle install` to install all of the required gems

## Running
### Locally:

Run tests individually:

1. Switch to the /spec/ folder
2. Run the tests at command line ```rspec <specname>.rb```

Run tests in parallel:

1. Run tests at the command line ```rake local:chrome``` or ```rake local:firefox```

### Remotely at SauceLabs:
(Must have a SauceLabs account:)

1. Update config_cloud.rb file for
  - SAUCE_USERNAME
  - SAUCE_ACCESS_KEY
2. Run the tests at command line ```rspec -r ./config_cloud.rb```
or
3. Run the tests in parallel at the command line ```rake cloud:<browser[options]>```

## Other Selenium Examples

References to other code I've created:

- Running Headless Chrome. Code: https://gist.github.com/ckenst/c1e7f32f290312adfeec46a93d283ac0
- Running Chrome in a Docker container. Code: https://gist.github.com/ckenst/38e1651793cf8955d605ac72697682da


## Other things
- Removed `gem 'sauce_whisk', '~> 0.0.21'`
