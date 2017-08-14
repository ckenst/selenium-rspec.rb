#description
require_relative '../pages/javascript'
require_relative 'spec_helper'

describe 'JavaScript Alerts' do

  before(:each) do
    @javascript = JavaScript.new(@driver)
  end

  it 'dismissed' do
    @driver.get 'http://the-internet.herokuapp.com/javascript_alerts'
    @driver.find_elements(css: 'button')[1].click #1. Uses findElements() which returns an array or a list of elements. Not be confused with findElement(). 2. Clicks on the second button on the page

    popup = @driver.switch_to.alert #focuses on the js pop up
    popup.accept #.dismiss to click cancel

    result = @driver.find_element(id: 'result').text
    expect(result).to eql('You clicked: Ok')
  end

end
