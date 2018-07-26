desc 'Update Gem Bundles'
task :update_bundles do
  puts ''
  puts '-' * 50
  puts "Updating Bundles".center(50)
  puts '-' * 50
  puts ''

  Dir["#{__dir__}/**/starting_point"].each do |kata_dir|
    run_bundler(kata_dir) if gemfile_present?(kata_dir)
  end
end

def run_bundler(dir)
  print "Updating: #{dir}: "
  result = `cd #{dir} && bundle update`
  puts result
  puts '-'
  puts '-'
end

def gemfile_present?(dir)
  File.exists?("#{dir}/Gemfile")
end
