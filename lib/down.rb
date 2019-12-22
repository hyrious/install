require_relative 'pbar'
require 'open-uri'

def down url, filename=File.basename(url)
  unless File.exist? filename
    print "Downloading #{filename}: "
    open(URI.encode(url), **pbar.kwargs) { |f|
      open(filename, 'wb') { |t|
        IO.copy_stream(f, t)
      }
      puts
    }
  end
  return filename
end

def easy_down *args
  filename = down *args
  puts "Executing #{filename}"
  system 'start', filename
rescue => e
  puts "#{e.class}: #{e}"
  raise
rescue Interrupt
  puts "^C"
end
