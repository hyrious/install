# https://www.sublimetext.com/3

require 'open-uri'
require_relative 'lib/down'

html = open 'https://www.sublimetext.com/3' do |f|
  f.read
end

easy_down html.scan(/id="dl_win_64"><a href="(.+?)">/)[0][0]
