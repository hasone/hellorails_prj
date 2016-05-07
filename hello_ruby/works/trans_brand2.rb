# coding: utf-8
require 'zip/zip'
require File.join(File.expand_path"../../../config/environment.rb", __FILE__)

def trans_brand(dir_path)
  if File.directory? dir_path
    Dir.foreach(dir_path) do |file|
      if file != "." and file != ".."
        trans_brand(dir_path + "/" + file)
      end
    end
  else
    if [".jpg", ".JPG", ".png", ".PNG", ".gif", ".GIF"].include?(File.extname(dir_path))
      brand_name = File.basename(dir_path, ".*")
      brand = Brand.find_or_create(name: brand_name)
      brand.logo = File.open(dir_path)
      if brand.save
        puts "+++++++++++++++++++++++ #{brand_name} save success"
      else
        puts "----------------------- #{brand_name} save failed"
      end
    end

  end
end

# trans_brand("/tmp/brands")

def unzip(file_name)
  equipment_path = "/tmp/equipment"
  Dir.delete(equipment_path)
  return
  if File.exist?(file_name) && File.file?(file_name) && [".zip"].include?(File.extname(file_name))
    #if File.executable?(file_name)

    if Dir.exist?(equipment_path)
      Dir.delete(equipment_path)
    end
    Dir.mkdir(File.join(Dir.home, ".foo"), 0700)
    dir1 = File.dirname(file_name)

    puts dir1
    full_path = File.expand_path(file_name)
    puts full_path
    Zip::ZipFile::open(file_name) do |file|
      puts zent
    end
    #end
  end
=begin
  full_path = File.expand_path(file_name)
  #entries = get_entries_name(path)
  puts "#{full_path}"
  Zip::ZipFile.open(file_name, Zip::ZipFile::CREATE) {
    |zipfile|
    zipfile.each do |zent|
      puts zent
    end
  }
=end
  #Zip::ZipFile::open(file_name) do |file|
  #  puts zent
  #end
end

=begin
def unzip(path)
  full_path = File.expand_path(path)
  entries = get_entries_name(path)

  Zip::ZipFile.open(full_path) do |f|
    entries.each do |entry|
      f.extract(entry,entry) {true}
      puts "unzip #{entry} succeed!"
    end
  end
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
=end

unzip "/home/think/workspace/whistler/app/works/equipment.zip"

