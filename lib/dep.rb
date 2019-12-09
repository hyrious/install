# Dependency Resolver
# 
# Usage:
#     >> dep 'scoop'
#     => which scoop ... not found!

def which bin
  exts = ENV['PATHEXT'].split File::PATH_SEPARATOR
  if exts.include? File.extname bin
    bin = [bin]
  else
    bin = exts.map { |e| bin + e }
  end
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |dir|
    bin.each do |filename|
      path = File.join dir, filename
      return path if File.exist? path
    end
  end
  return nil
end

def dep *binaries
  deps = binaries.select { |e| not which e }
  unless deps.empty?
    last = deps.pop(2).join(' and ')
    puts "requires #{[*deps, last].join(', ')}"
    exit
  end
end
