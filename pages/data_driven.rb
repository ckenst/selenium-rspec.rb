require_relative 'base_page'

class DataDriven < BasePage
  FLASH_MESSAGE     = {class: 'flash' }

  def initialize(driver)
    super
    @driver.get 'http://the-internet.herokuapp.com/login'
  end

  def user_data
    user_data = CSV.read Dir.pwd + '/data/user_data.csv'
    descriptor = user_data.shift
    descriptor = descriptor.map { |key| key.to_sym }
    user_data.map { |user| Hash[ descriptor.zip(user) ] }
  end

  def notification_text
    wait_for(5) { is_displayed? FLASH_MESSAGE }
    find(FLASH_MESSAGE).text.delete('^a-zA-z !.')
  end
end
