## README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Step 1. 创建基于ruby2.3.0pre的Rails5.0.0beta3项目，项目名称为depot
	rails new depot -d postgresql -B
	# rails new depot -d postgresql -B -T

* Step 2. 初始化git
	cd depot
	git init
	git config --global user.name "Firstname Lastname"
	git config --global user.email "your_email@youremail.com"
	git config --global github.user username
	git config --global github.token github_token
	git remote add origin git@github.com:hasone/hellorails_prj.git
	git add .
	git commit -m 'First Commit with rails new'
	git push origin master
* Step 3. 使用Scaffold生成Product的model,views,controller,migration
	rails generate scaffold Product title:string \
	  description:text image_url:string price:decimal

* Step 4. 创建Product数据库实体
	rails db:create
	rails db:migrate

* Step 5. 优化css
	到Step4为止，可以使用rails server启动本地的rails服务，并在浏览器中输入http://localhost:3000/products查看生成的网页效果
	a. 修改products.scss
	    vim app/assets/stylesheets/products.scss
	b. 修改application.html.erb
	    vim app/views/layouts/application.html.erb
	c. 修改index.html.erb
	    vim app/views/products/index/html.erb
	到此为止，可以再重新加载一次http//localhost:3000/products查看网页效果

* Step 6. how to do database rollback
	rails db:rollback

* Step 7. 数据库初始化脚本编写
	数据库初始化脚本文件为db/seeds.rb，需要初始化的数据请完成此文件的编写。
	编写完成后，执行rails db:seed即可在数据库生成初始化的数据

* Step 8. rails单元测试
	单元测试的代码及database.yml文件均在test目录下，单元测试需要包含model validates
	<!-- 编写完测试代码后，执行 rails test 执行全部单元测试 或执行 rails test directories/files  进行单元测试

  * Step 9. 创建Store
    rails generate controller Store index
    
