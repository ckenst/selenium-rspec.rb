#description goes here

require_relative '../pages/dropdown'

describe 'Dropdown' do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @dropdown = DropDown.new(@driver)
  end

  after(:each) do
    @driver.quit
  end

  it 'selected' do
    dropdown_list = @driver.find_element(id: 'dropdown')
    options = dropdown_list.find_elements(tag_name: 'option')
    options.each { |option| option.click if option.text == 'Option 2' }

    selected_option = options.map { |option| option.text if option.selected? }.join
    expect(selected_option).to eql 'Option 2'
  end
end
