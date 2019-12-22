# https://github.com/microsoft/vcpkg

require 'fileutils'
require_relative 'lib/dep'

dep 'git'

include FileUtils

cd File.join(Dir.home, 'Documents') do
  mkdir_p 'GitHub'
  cd 'GitHub' do
    unless Dir.exist? 'vcpkg'
      system 'git clone https://github.com/Microsoft/vcpkg --branch=master --depth=1'
    end
    cd 'vcpkg' do
      system 'git pull'
      system '.\bootstrap-vcpkg.bat'
      system 'vcpkg integrate install'
    end
  end
end
