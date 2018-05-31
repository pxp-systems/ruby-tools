require 'yaml'
require 'pp'


your_account = YAML.load_file("market1.txt")
pp your_account

out_file = File.open "yaml.txt", "a+"



out_file.write(your_account.to_yaml)