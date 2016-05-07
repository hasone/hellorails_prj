#!/usr/bin/ruby
# test 简单的压缩解压工具

gem 'rubyzip'
require 'zip'

def get_entries_name(path)
  full_path = File.expand_path(path)
  entries = []
  Zip::ZipInputStream::open(full_path) do |io|
    # puts io.methods
    while (entry = io.get_next_entry)
      entries << entry.name
    end
  end
  entries
end

get_entries_name "/home/think/1/test.zip"


=begin
Zip::File.open("/home/think/1/test.zip", Zip::File::CREATE) {
  |zipfile|

  zipfile.get_output_stream("first.txt") { |f| f.puts "Hello from ZipFi2222222222le" }
  #zipfile.mkdir("a_dir")
}

#The next example reopens my.zip writes the contents of first.txt to standard out and deletes the entry from the archive.

Zip::File.open("/home/think/1/test.zip", Zip::File::CREATE) {
  |zipfile|
  zipfile.each do |zent|
    puts zent
    puts zipfile.read(zent)
    #zipfile.remove("first.txt")
  end
}

# get_entries_name "/home/think/1/test.zip"
=end
