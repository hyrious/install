# https://github.com/hyrious/oh-my-tuna

require 'open-uri'
url = 'https://raw.githubusercontent.com/hyrious/oh-my-tuna/master/oh-my-tuna.ps1'
script = URI.open(url) { |f| f.read }
encoded = [script.encode('UTF-16LE')].pack('m0')
system 'powershell', '-EncodedCommand', encoded
