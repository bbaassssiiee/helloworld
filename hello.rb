#!/usr/bin/env ruby
require 'fileutils'
version='%%VERSION%%-%%RELEASE%%'
def imcdate
    t = Time.now
    return t.strftime("%Y.%m.%d-%H.%M.%S") 
end

if ARGV[0] =~ /-v/i
    puts 'hello.py ' + version.to_s
    exit
end

myLogDir = ENV['HOME'] + '/log/hello.rb/' + imcdate

FileUtils.mkdir_p(myLogDir)
File.open(myLogDir+'/hello.log', 'w') do |f|
   f.puts imcdate + ' : INFO : ' + 'Hello World!'
end 
puts 'Hello World!'
