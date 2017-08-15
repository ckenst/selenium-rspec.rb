#description

require_relative '../pages/table_sort'
require_relative 'spec_helper'

describe 'Sorting a list' do

  before(:each) do
    @table_sort = TableSort.new(@driver)
  end

  it 'one way' do
    @driver.get 'http://the-internet.herokuapp.com/tables'
    @driver.find_element(css: '#table1 thead tr th:nth-of-type(4)').click #click the column header to sort

    dues = @driver.find_elements(css: '#table1 tbody tr td:nth-of-type(4)')
    due_values = dues.map { |due| due.text.delete('$').to_f } #clean up the values by deleting dollar sign and then convert to float. Store them in the due_values collection.

    expect(due_values).to eql due_values.sort #compare this list to a "sorted" version of the same list. If we wanted descending we'd do due_values.sort.reverse
  end

  it 'second way' do
    @driver.get 'http://the-internet.herokuapp.com/tables'
    @driver.find_element(css: '#table2 thead .dues').click #click the column header to sort

    dues = @driver.find_elements(css: '#table2 thead .dues') #the table header dues now has a class of it's own
    due_values = dues.map { |due| due.text.delete('$').to_f } #clean up the values by deleting dollar sign and then convert to float. Store them in the due_values collection.

    expect(due_values).to eql due_values.sort #compare this list to a "sorted" version of the same list. If we wanted descending we'd do due_values.sort.reverse
  end

end
