require_relative '../pages/split_test'
require_relative 'spec_helper'

describe 'Split Test' do

  before(:each) do
    @split = SplitTest.new(@driver)
  end

  it 'Opts out after checking the variant' do
    @driver.get 'http://the-internet.herokuapp.com/abtest'
    heading_text = @driver.find_element(css: 'h3').text
    expect(['A/B Test Variation 1', 'A/B Test Control'].include? heading_text).to eql true
    @driver.manage.add_cookie(name: 'optimizelyOptOut', value: 'true')
    @driver.navigate.refresh
    heading_text = @driver.find_element(css: 'h3').text
    expect(heading_text).to eql 'No A/B Test'
  end

  it 'Opts out and then checks the variant' do
    @driver.get 'http://the-internet.herokuapp.com'
    @driver.manage.add_cookie(name: 'optimizelyOptOut', value: 'true')
    @driver.get 'http://the-internet.herokuapp.com/abtest'
    expect(@driver.find_element(css: 'h3').text).to eql 'No A/B Test'
  end

  it 'Opts out using the url' do
    @driver.get 'http://the-internet.herokuapp.com/abtest?optimizely_opt_out=true'
    @driver.switch_to.alert.dismiss
    expect(@driver.find_element(css: 'h3').text).to eql 'No A/B Test'
  end
end
