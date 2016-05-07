#!/usr/bin/ruby
#简单的压缩解压工具
#code by 侯佩|hopy 2014-12-01

require 'zip/zip'

def sh_e(e)
  e.backtrace.each {|s|puts s}
  puts "ERR : #{e.to_s} \n"
end

#取得zip文件中所有的entry名称
def get_entries_name(path)
  full_path = File.expand_path(path)
  entries = []
  Zip::ZipInputStream::open(full_path) do |io|
    while (entry = io.get_next_entry)
      entries << entry.name
    end
  end
  entries
end

def unzip(path)
  full_path = File.expand_path(path)
  entries = get_entries_name(path)

  Zip::ZipFile.open(full_path) do |f|
    entries.each do |entry|
      f.extract(entry,entry) {true}
      puts "unzip #{entry} succeed!"
    end
  end
  #rescue =>e
  #  sh_e(e)
  #  exit 3
end

def zip_n2one(paths,zip_path)
  full_zip_path = File.expand_path(zip_path)
  f = Zip::ZipFile.open(full_zip_path,Zip::ZipFile::CREATE)
  paths.each do |path|
    full_path = File.expand_path(path)
    f.add(File.basename(path),full_path) {true}
    puts "add #{path} to #{full_zip_path}"
  end
  f.close
  puts "all files is zip to #{full_zip_path}"
  #rescue =>e
  #  sh_e(e)
  #  exit 4
end

def zip(path)
  full_path = File.expand_path(path)
  dir_name = File.dirname(full_path)
  only_name = File.basename(path,".*")
  only_zip_name = only_name + ".zip"
  full_zip_path = dir_name + '/' + only_zip_name

  f = Zip::ZipFile.open(full_zip_path,Zip::ZipFile::CREATE)
  f.add(File.basename(path),full_path) {true}
  f.close
  puts "create #{full_zip_path} succeed!"
  #rescue =>e
  #  sh_e(e)
  #  exit 5
end

is_unzip = false
case ARGV.count
when 0
  puts "usage #{$0} [-u] files [...]"
  exit 1
when 1
  if ARGV[0] == "-u"
    puts "ERR : unzip without filename!"
    exit 2
  end
else
  if ARGV[0] == "-u"
    is_unzip = true
    #将选项-u从参数列表中移除
    ARGV.shift
  end
end

if is_unzip
  ARGV.each {|file_path|unzip(file_path)}
else
  #ARGV.each {|file_path|zip(file_path)}
  zip_n2one(ARGV,"total.zip")
end

