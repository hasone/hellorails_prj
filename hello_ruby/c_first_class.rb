#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

class FirstClass
    # 类变量以 @@ 开头，且必须初始化后才能在方法定义中使用
    @@count = 0 # 定义本类初始化数量的一个类变量
    def initialize(id, name)
        @cust_id = id
        @cust_name = name
    end

    def display
        puts "Customer id #@cust_id"
        puts "Customer name #@cust_name"
    end

    def total
        @@count += 1
        puts "Total number of FirstClass : #@@count"
    end

    cust1 = FirstClass.new(1, "zhangsan")
    cust2 = FirstClass.new(2, "lisi")

    cust1.display
    cust1.total
    cust2.display
    cust2.total



end