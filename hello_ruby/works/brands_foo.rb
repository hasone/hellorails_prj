require File.join(File.expand_path"../../../config/environment.rb", __FILE__)

def upload_brands(dir_name)
  if Dir.exist?(dir_name)
    # Dir.chdir(dir_name) do
    #   puts Dir.pwd
    # end
    # puts Dir.entries(dir_name)

    #Dir.foreach(dir_name){|file_name|
    #  puts "#{file_name}"
    #}
    #end

    # p Dir.glob("*")

    p Dir.glob("*.[png][jpg][gif][PNG][JPG][GIF]")

  end
end


def file_method
=begin
  if File.exist?(file_name) and @dir = File.directory?(file_name)
    @dir
  end
=end
end

# e = SkiEquipment.first
# print e.methods.sort
# puts e.to_yaml
# puts e.to_json

# File.absolute_path
# File.atime
# File.extname
# File.file?
# File.basename
# File.chown(0644, file_name)
# File.ctime
# File.directory?
# File.dirname
# File.executable?
# File.exist?
upload_brands("/home/think/图片")
