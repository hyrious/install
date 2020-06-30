# https://www.sublimetext.com/3

require 'open-uri'
require_relative 'lib/down'

html = fetch 'https://www.sublimetext.com/3'
easy_down html.scan(/id="dl_win_64"><a href="(.+?)">/)[0][0]
