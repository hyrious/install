# https://www.msys2.org

require_relative 'lib/down'

url = 'https://mirrors.tuna.tsinghua.edu.cn/msys2/distrib/msys2-x86_64-latest.exe'

begin
  filename = down url
  puts "Executing #{filename}"
  system 'start', filename
rescue => e
  puts "#{e.class}: #{e}"
rescue Interrupt
  puts "^C"
end
