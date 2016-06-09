#Key presses can be used to interact with a website. This presses a key and then verifies it was inputted.

require_relative '../pages/key_press'

describe 'Key Press is' do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @key = KeyPress.new(@driver)
  end

  after(:each) do
    @driver.quit
  end

  it 'Down' do
    @key.send_keys
    expect(@key.find_result).to eql ('You entered: DOWN')
  end
end
