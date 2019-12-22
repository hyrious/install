# https://www.sublimemerge.com/download

require 'open-uri'
require_relative 'lib/down'

html = open 'https://www.sublimemerge.com/download' do |f|
  f.read
end

easy_down html.scan(/id="dl_win_64"><a href="(.+?)">/)[0][0]
