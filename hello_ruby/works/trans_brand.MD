trans_brand.rb为品牌表数据初始化脚本，
用于将品牌图片从本地上传到服务器，并自动保存到数据库中.
1. 使用条件：
   a. 只适用于新增品牌， 不适用于[ 品牌图片 | 品牌名称 ]的更新，如果需要更新[ 品牌图片 | 品牌名称 ]，
   b. 品牌图片只能是[ .png | .jpg ]后缀，
   c. 品牌图片的名称必须与品牌的实际名称一致，如果不一致只能到管理后台中进行修改，
   d. 此脚本的品牌名称区分大小写，比如 [5th.jpg] 与 [5TH.jpg]是两个不同的品牌

2. 使用方法：
   a. 拷贝品牌图片的文件夹或压缩包到服务器上，例如：
      scp [-P port_num] [-r] /home/user/brands.zip user@host:/tmp
   b. 如果拷贝的是解压包文件，则需要解压，否则跳过此步骤
      如果压缩包后缀为[.zip]，使用如下命令：
      ssh [-p port_num] user@host "unzip [-o] [-j] -d /tmp/brands /tmp/brands.zip"
      如果压缩包后缀为[ .gz | .tar.gz | tgz | bz2 | .Z | .tar.Z | .tar.bz2 | .tar ]
      ssh [-p port_num] user@host "gunzip brands.gz"
      ssh [-p port_num] user@host "tar -zxvf [ brands.tar.gz | brands.tgz ]"
      ssh [-p port_num] user@host "bunzip2 brands.bz2"
      ssh [-p port_num] user@host "uncompress brands.Z"
      ssh [-p port_num] user@host "tar -xZvf brands.tar.Z"
      ssh [-p port_num] user@host "tar -xjvf brands.tar.bz2"
      ssh [-p port_num] user@host "tar -xvf brands.tar"
      
   c. 在远程服务器中执行trans_brand.rb脚本，调用时需要指定品牌图片的文件夹路径，例如：
      ssh [-p port_num] user@host "cd /fenxuekeji/whistler/current/app/works && ruby trans_brand.rb /tmp/brands"


 

