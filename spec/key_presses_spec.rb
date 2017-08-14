#Key presses can be used to interact with a website. This presses a key and then verifies it was inputted.

require_relative '../pages/key_press'
require_relative 'spec_helper'

describe 'Key Press is' do

  before(:each) do
    @key = KeyPress.new(@driver)
  end

# I think this test is missing some things!

  # it 'Down' do
  #   @key.send_keys
  #   expect(@key.find_result).to eql ('You entered: DOWN')
  # end
end
