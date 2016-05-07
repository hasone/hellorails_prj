#!/usr/bin/ruby -w
# -*- coding: utf-8 -*-

=begin
    模块（Module）是一种把方法、类和常量组合在一起的方式。模块（Module）为您提供了两大好处。
        模块提供了一个命名空间和避免名字冲突。
        模块实现了 mixin 装置。
    模块（Module）定义了一个命名空间，相当于一个沙盒，在里边您的方法和常量不会与其他地方的方法常量冲突。
    模块类似与类，但有一下不同：
        模块不能实例化
        模块没有子类
        模块只能被另一个模块定义

    语法：
        module Identifier
           statement1
           statement2
           ...........
        end

    模块常量命名与类常量命名类似，以大写字母开头。方法定义看起来也相似：模块方法定义与类方法定义类似。
    通过类方法，您可以在类方法名称前面放置模块名称和一个点号来调用模块方法，您可以使用模块名称和两个冒号来引用一个常量。

=end

module Week
  FIRST_DAY = "Sunday"
  def Week.weeks_in_month
    puts "You have four weeks in a month"
  end
  def Week.weeks_in_year
    puts "You have 52 weeks in a year"
  end
end
