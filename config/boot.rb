require 'rubygems'
#require 'yaml'
#require 'yaml'
#
#d = Dir["./s3.yml"]
#d.each do |file|
#  begin
#    puts "checking : #{file}"
#    f =  YAML.load_file(file)
#  rescue Exception
#    puts "failed to read #{file}: #{$!}"
#  end
#end

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
