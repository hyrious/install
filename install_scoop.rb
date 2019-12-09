# https://scoop.sh

script = <<~PS1
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
  Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
PS1
encoded = [script.encode('UTF-16LE')].pack('m0')
system 'powershell', '-EncodedCommand', encoded
