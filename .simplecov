SimpleCov.start 'test_frameworks' do
  track_files '{app,lib}/**/*.rb'
end if ENV['CI']
