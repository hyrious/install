require_relative 'pbar'
require 'open-uri'

def down url, filename=File.basename(url)
  unless File.exist? filename
    print "Downloading #{filename}: "
    open(url, **pbar.kwargs) { |f|
      open(filename, 'wb') { |t|
        IO.copy_stream(f, t)
      }
      puts
    }
  end
  return filename
end
