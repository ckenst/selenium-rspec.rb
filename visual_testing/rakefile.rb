# filename: Rakefile

desc 'Run tests against each screen resolution we care about'
task :run do
  RESOLUTIONS = [ { width: '1000', height: '600' },
                  { width:  '414', height: '699' },
                  { width:  '320', height: '568' } ]
  threads = []
  RESOLUTIONS.each do |resolution|
    threads << Thread.new do
      ENV['viewport_width'] = resolution[:width]
      ENV['viewport_height'] = resolution[:height]
      system("rspec login_spec.rb")
    end
  end
  threads.each { |thread| thread.join }
end
