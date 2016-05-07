#!/usr/bin/ruby -w
# -*- coding : utf-8 -*-

#puts print 都是向控制台打印字符，其中puts带回车换行符

puts "Hello, Ruby!"

print <<EOF
这是第一种方式创建here document 。
多行字符串。
EOF

print <<"EOF";  # 与上面相同
这是第二种方式创建here document 。
多行字符串。
EOF

print <<`EOC`
echo hi there
echo lo there
EOC

print <<"foo", <<"bar"  # 您可以把它们进行堆叠
I said foo.
  foo
I said bar.
  bar

puts "This is main Ruby Program"
BEGIN {
  puts "Initializing Ruby"
}

END {
  puts "Terminating Ruby Program"
}
