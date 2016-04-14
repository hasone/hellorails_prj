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
	rails new depot -d postgresql -B -T

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

	
