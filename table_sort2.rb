#filename: table_sort2.rb

require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  @driver = Selenium::WebDriver.for :firefox
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do
  @driver.get 'http://the-internet.herokuapp.com/tables'

  @driver.find_element(css: '#table2 thead .dues').click #click the column header to sort

  dues = @driver.find_elements(css: '#table2 thead .dues') #the table header dues now has a class of it's own
  due_values = dues.map { |due| due.text.delete('$').to_f } #clean up the values by deleting dollar sign and then convert to float. Store them in the due_values collection.

  expect(due_values).to eql due_values.sort #compare this list to a "sorted" version of the same list. If we wanted descending we'd do due_values.sort.reverse
end
