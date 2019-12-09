# https://github.com/hyrious/oh-my-tuna

require 'open-uri'
url = 'https://raw.githubusercontent.com/hyrious/oh-my-tuna/master/oh-my-tuna.ps1'
script = open url do |f|
  f.read
end
encoded = [script.encode('UTF-16LE')].pack('m0')
system 'powershell', '-EncodedCommand', encoded
