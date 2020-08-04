# https://github.com/thisredone/rb

require 'fileutils'
require_relative 'lib/down'

FileUtils.mkdir_p 'rb'
FileUtils.cd 'rb' do
  down 'https://cdn.jsdelivr.net/gh/thisredone/rb@master/rb'
  File.write 'rb.gemspec', <<~RUBY
    Gem::Specification.new do |s|
      s.name = 'rb'
      s.version = '0.1.0'
      s.authors = ['thisredone']
      s.summary = 'Turns Ruby into a versatile command line utility'
      s.homepage = 'https://github.com/thisredone/rb'
      s.license = 'MIT'
      s.files = ['rb']
      s.bindir = '.'
      s.executables = ['rb']
    end
  RUBY
  system 'gem uninstall rb'
  system 'gem build rb.gemspec'
  puts 'Installing...'
  system 'gem install rb-0.1.0.gem'
end
FileUtils.rm_rf 'rb'
puts 'Done. Try: dir /b | rb sort.reverse'
