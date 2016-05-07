#!/usr/bin/ruby -w
# -*- coding: utf-8 -*-

=begin
    这是注释，称作：嵌入式文档注释 
    类似C#中的/**/

    一般小写字母、下划线开头：变量（Variable）。
    $开头：全局变量（Global variable）。
    @开头：实例变量（Instance variable）。
    @@开头：类变量（Class variable）类变量被共享在整个继承链中
    大写字母开头：常数（Constant）。
=end

#整型 Integer 以下是一些整型字面量
#字面量（literal）：代码中能见到的值，数值，bool值，字符串等都叫字面量
#如以下的0,1_000_000,0xa等

a1= 123          # Fixnum 十进制
a2 = 1_234      # Fixnum 带有下划线的十进制
a3 = -500        # 负的 Fixnum
a4 = 0377       # 八进制
a5 = 0xff         # 十六进制
a6 = 0b1011   # 二进制
a7 = "a".ord   # "a" 的字符编码
a8 = ?\n         # 换行符（0x0a）的编码
a9 = 12345678901234567890 # Bignum

puts a1, a2, a3, a4, a5, a6, a7, a8, a9

# 浮点型 它们是带有小数的数字。浮点数是类 Float 的对象，且可以是下列中任意一个。
b1 = 123.4
b2 = 1.5e6
b3 = 4E20
b4 = 4e+20

puts b1, b2, b3, b4

# 算术操作
# 加减乘除操作符：+-*/；指数操作符为**, 指数不必是整数

puts 2**(7/3) # 7与3的商为2，然后2的2次方为4

# 字符串类型
# Ruby 字符串简单地说是一个 8 位字节序列，它们是类 String 的对象。
# 双引号标记的字符串允许替换和使用反斜线符号，单引号标记的字符串不允许替换，且只允许使用 \\ 和 \' 两个反斜线符号。
# 反斜线符号
=begin
    \n              换行符 (0x0a)
    \r              回车符 (0x0d)
    \f              换页符 (0x0c)
    \b              退格键 (0x08)
    \a              报警符 Bell (0x07)
    \e              转义符 (0x1b)
    \s              空格符 (0x20)
    \nnn         八进制表示法 (n 是 0-7)
    \xnn         十六进制表示法 (n 是 0-9、a-f 或 A-F)
    \cx, \C-x   Control-x
    \M-x         Meta-x (c | 0x80)
    \M-\C-x     Meta-Control-x
    \x              字符 x
=end
puts 'escape using "\\"'
puts "escape using \n Entry"
puts 'That\'s right'

# 您可以使用序列 #{ expr } 替换任意 Ruby 表达式的值为一个字符串。在这里，expr 可以是任意的 Ruby 表达式。
puts "Multiplication Value : #{24*60*60}"

name = "Ruby"
puts "#{name+",ok"}"

name1 = "Joe"
name2 = "Mary"
puts "你好 #{name1},  #{name2} 在哪?"

# 字符串中进行数学运算
x, y, z = 12, 36, 72
puts "x 的值为 #{ x }"
puts "x + y 的值为 #{ x + y }"
puts "x + y + z 的平均值为 #{ (x + y + z)/3 }"

# Ruby 中还支持一种采用 %q 和 %Q 来引导的字符串变量，%q 使用的是单引号引用规则，而 %Q 是双引号引用规则，后面再接一个 (! [ { 等等的开始界定符和与 } ] ) 等等的末尾界定符。
# 跟在q或Q后面的字符是分界符.分界符可以是任意一个非字母数字的单字节字符.如:[,{,(,<,!等,字符串会一直读取到发现相匹配的结束符为止.
desc1 = %Q{Ruby 的字符串可以使用 '' 和 ""。}
desc2 = %q|Ruby 的字符串可以使用 '' 和 ""。|
puts desc1
puts desc2

=begin
    字符编码
    Ruby 的默认字符集是 ASCII，字符可用单个字节表示。如果您使用 UTF-8 或其他现代的字符集，字符可能是用一个到四个字节表示。
    您可以在程序开头使用 $KCODE 改变字符集，如下所示：
        a   ASCII （与 none 相同）。这是默认的。
        e   EUC。
        n   None （与 ASCII 相同）。
        u   UTF-8。
=end

# 字符串内建方法
myStr = String.new("THIS IS TEST")
mystr = myStr.downcase
puts "#{mystr}"

# 数组
=begin
    数组字面量通过[]中以逗号分隔定义，且支持range定义。
    （1）数组通过[]索引访问
    （2）通过赋值操作插入、删除、替换元素
    （3）通过+，－号进行合并和删除元素，且集合做为新集合出现
    （4）通过<<号向原数据追加元素
    （5）通过*号重复数组元素
    （6）通过｜和&符号做并集和交集操作（注意顺序）
=end

array = [ "pro", 10, 3.2, "last element" ]
puts "arrays test ====="
array.each do |i|
    print i
    print ', '
end
puts ''

array1 = Array.new
array2 = Array.new(20)
print array1.size, array1.length, array2.size, array2.length
puts ""

# 数组内建方法
# Array.[](...) [or] Array[...] [or] [...]

array3 = Array.[](1, 2, 3, 4, 5, 6, 7, 8)
array4 = Array[1, 2, 3, 4, 5, 6, 7, 8]

array5 = Array(0..8)
array6 = [0, 1, 2, 3, 4, 5, 6, 7, 8]
arrIndex6 = array6.at(5)
puts "#{array3} #{array4} #{array5}" "#{array6}"

# 哈希类型
# Ruby 哈希是在大括号内放置一系列键/值对，键和值之间使用逗号和序列 => 分隔。尾部的逗号会被忽略。
    # 通过 new 类方法创建一个空的哈希：
    hash1 = Hash.new
    # 可以使用 new 创建带有默认值的哈希，不带默认值的哈希是 nil：
    hash2 = Hash.new("month")
    hash3 = Hash.new "month"
    puts "#{hash1} #{hash2} #{hash3}"
    puts "#{hash1[0]}"
    puts "#{hash2[5]} #{hash3[5]}"

    hash4 = Hash["a" => 100, "b" => 200]
    puts "#{hash4['a']} #{hash4["b"]}"

    hash5 = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
    hash5.each do |key, value|
      print key, " is ", value, "\n"
    end


    # 范围类型
=begin
    一个范围表示一个区间。
    范围是通过设置一个开始值和一个结束值来表示。范围可使用 s..e 和 s...e 来构造，或者通过 Range.new 来构造。
    使用 .. 构造的范围从开始值运行到结束值（包含结束值）。使用 ... 构造的范围从开始值运行到结束值（不包含结束值）。当作为一个迭代器使用时，范围会返回序列中的每个值。
    范围 (1..5) 意味着它包含值 1, 2, 3, 4, 5，范围 (1...5) 意味着它包含值 1, 2, 3, 4 。
=end

    (10..15).each do |n|
      print n, ' '
    end

    ('A'..'z').each do |n|
      print n, ""
    end

    $, =", "   # Array 值分隔符
    range1 = (1..10).to_a
    range2 = ('bar'..'bay').to_a

    puts "#{range1}"
    puts "#{range2}"

    range3 = 0..9

    puts range3.include?(5)
    ret = range3.min
    puts "最小值为 #{ret}"

    ret = range3.max
    puts "最大值为 #{ret}"

    ret = range3.reject {|i| i < 5 }
    puts "不符合条件的有 #{ret}"

    range3.each do |digit|
      print "在循环中 #{digit}"
    end
    puts ""

=begin
while gets
   print if /start/../end/
end
=end

    # 范围可以用在 case 语句中：
    score = 70

    result = case score
    when 0..40
      "糟糕的分数"
    when 41..60
      "快要及格"
    when 61..70
      "及格分数"
    when 71..100
      "良好分数"
    else
      "错误的分数"
    end

    puts result


    # 范围的最后一个用途是间隔检测：检查指定值是否在指定的范围内。需要使用 === 相等运算符来完成计算。
    if ((1..10) === 5)
      puts "5 在 (1..10)"
    end

    if (('a'..'j') === 'c')
      puts "c 在 ('a'..'j')"
    end

    if (('a'..'j') === 'z')
      puts "z 在 ('a'..'j')"
    end
