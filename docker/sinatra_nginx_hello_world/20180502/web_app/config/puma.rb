puts ''
puts '-' * 50
puts "PUMA CONFIGS".center(50)
puts '-' * 50
puts ''

workers 4
threads 2, 2
environment ENV.fetch('RACK_ENV')
bind 'tcp://0.0.0.0:5000'
