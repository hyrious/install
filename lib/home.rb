require_relative 'dep'
require 'json'

dep 'scoop'
home = ENV['USERPROFILE'].tr '\\', '/'
pattern = File.join home, 'scoop', 'buckets', '*', 'bucket', '*.json'
SCOOP_PATHS = Dir.glob pattern

def home name, download=false
  SCOOP_PATHS.select { |path| File.basename(path, '.json').include?(name) }.map { |path|
    json = JSON.load File.read path
    page = json["homepage"]
    if !page || download and checkver = json['checkver']
      page = checkver['url']
    end
    page && [File.basename(path, '.json'), page]
  }.compact
end

if __FILE__ == $0
  PREFER_DOWNLOAD = !!ARGV.delete('--download')
  OPEN = !!ARGV.delete('--open')
  ARGV.each do |name|
    urls = home name, PREFER_DOWNLOAD
    puts urls.map { |app, url| "#{app}: #{url}" }
    urls.each { |_, url| system 'start', '', url } if OPEN 
  end
end
