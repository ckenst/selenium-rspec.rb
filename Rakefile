def launch_with(config_filename)
  if ENV['tag']
    test_options = "-r ./config/#{config_filename} --order random --tag #{ENV['tag']}"
  else
    test_options = "-r ./config/#{config_filename} --order random"
  end
  if ENV['slow']
    system("rspec #{test_options}")
  else
    system("parallel_rspec -n 4 --test-options '#{test_options}' spec") # limiting to 4 parallel tests at once
  end
end

namespace :local do
  BROWSERS_LOCAL = [ 'firefox', 'chrome' ]
  BROWSERS_LOCAL.each do |browser|
    desc "Run tests locally on #{browser.capitalize}"
    task browser.to_sym do
      ENV['browser'] = browser
      launch_with('local.rb')
    end
  end
end

# This isn't set up yet
# namespace :cloud do
#   BROWSERS_CLOUD =  [ 'firefox', 'chrome', 'internet_explorer']
#   BROWSERS_CLOUD.each do |browser|
#     desc "Run tests in Sauce Labs on #{browser.capitalize}"
#     task browser.to_sym, :version, :os do |t, args|
#       ENV['browser'] = browser
#       ENV['browser_version']  = args[:version]
#       ENV['operating_system'] = args[:os]
#       launch_with('cloud.rb')
#     end
#   end
end
