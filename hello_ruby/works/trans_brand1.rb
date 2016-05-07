# coding: utf-8
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
      # Base64::encode64(File.read(dir_path))
    end

  end
end

# trans_brand("/home/think/1/2")

