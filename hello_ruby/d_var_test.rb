#!/usr/bin/ruby -w
# -*- coding: utf-8 -*-

# 在 Ruby 中，您可以通过在变量或常量前面放置 # 字符，来访问任何变量或常量的值

# 定义一个全局变量
$global_variable = 10

# 定义一个常量
NUM_ONE = 1

class Class1
  def print_global
    puts "Class1调用全局变量$global_variable，输出为：#$global_variable "
  end
end

class Class2
  def print_global
    puts "Class2调用全局变量$global_variable，输出为：#$global_variable "
  end
end

class1obj = Class1.new
class1obj.print_global

class2obj = Class2.new
class2obj.print_global

puts "调用常量 NUM_ONE 输出为：#{NUM_ONE}"

=begin
    Ruby 伪变量
    它们是特殊的变量，有着局部变量的外观，但行为却像常量。您不能给这些变量赋任何值。
    self: 当前方法的接收器对象。
    true: 代表 true 的值。
    false: 代表 false 的值。
    nil: 代表 undefined 的值。
    __FILE__: 当前源文件的名称。
    __LINE__: 当前行在源文件中的编号。
=end

def test(a="Ruby", b="Perl")
  puts "a = #{a}, b = #{b}"
end

test
test "Python"
test "Java", "Javascript"

# 可变数量的参数
def sample (*test)
  for i in 0...test.length
    print "#{test[i]}, "
  end
  puts "参数个数为 #{test.length}"
end

sample "Zara", "H&M"
sample "如家", "七天", "汉庭", "速8"
