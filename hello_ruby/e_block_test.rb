#!/usr/bin/ruby -w
# -*- coding: utf-8 -*-

=begin
    Ruby 块
    块由大量的代码组成。
    您需要给块取个名称。
    块中的代码总是包含在大括号 {} 内。
    块总是从与其具有相同名称的函数调用。这意味着如果您的块名称为 test，那么您要使用函数 test 来调用这个块。
    您可以使用 yield 语句来调用块。
=end

def test
  puts "我在test方法这儿"
  yield
  puts "回到test方法里"
  yield
end

# test块
test {
  puts "来到了test块这儿"
}

def testYield
  puts "在testYield方法内"
  yield 998
  puts "回到testYield方法内"
  yield 99
end

testYield { |i|
  puts "这是一个带参数的Ruby 块, 参数值： #{i}"
}
