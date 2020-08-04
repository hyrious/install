#

require 'fileutils'
require_relative 'lib/down'

html = fetch 'https://www.ruby-lang.org/en/downloads/'
file = down html[%r{https://cache\.ruby-lang\.org/pub/ruby/.*\.tar\.gz}]
tar = File.basename file, '.gz'
raw = File.basename tar, '.tar'
system "7z x #{file}"
system "7z x #{tar}"
FileUtils.cd raw do
  system 'rdoc --all --ri'
end
FileUtils.rm_rf [raw, tar, file]
