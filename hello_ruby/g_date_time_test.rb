#!/usr/bin/ruby -w
# -*- coding: UTF-8 -*-

time1 = Time.new

puts "当前时间 : " + time1.inspect

# Time.now 功能相同
time2 = Time.now
puts "当前时间 : " + time2.inspect

time = Time.new

# Time的组件
puts "当前时间：" + time.inspect
puts "日期的年份是 => #{time.year}"
puts "日期的月份是 => #{time.month}"                                 # 月份： 1～12
puts "一个月中的第几天 => #{time.day}"                              # 一个月中的第几天 1 ～ 31
puts "一周中的第几天 => #{time.wday}"                               # 一周中的星期几 0是星期天
puts "一年中的第几天 => #{time.yday}"                                # 一年当中的第几天 1 ~ 365
puts "日期的小时是 => #{time.hour}"                                    # 24小时制
puts "日期的分钟是 => #{time.min}"                                      # 0 ~ 59
puts "日期的秒数是 => #{time.sec}"                                       # 0 ~ 59
puts "日期的微妙是 => #{time.usec}"                                     # 0 ~ 999999
puts "日期的时区是 => #{time.zone}"                                     # 时区名称 : UTC
puts "相对UTC的偏移量是 => #{time.utc_offset}"                 # 相对于 UTC 的偏移秒数
# puts time.utc
# puts time.methods.sort

=begin
Time.utc、Time.gm 和 Time.local 函数
这些函数可用于格式化标准格式的日期，如下所示：
    # July 8, 2008
    Time.local(2008, 7, 8)  
    # July 8, 2008, 09:10am，本地时间
    Time.local(2008, 7, 8, 9, 10)   
    # July 8, 2008, 09:10 UTC
    Time.utc(2008, 7, 8, 9, 10)  
    # July 8, 2008, 09:10:11 GMT （与 UTC 相同）
    Time.gm(2008, 7, 8, 9, 10, 11)  

    # 返回从纪元以来的秒数
    time = Time.now.to_i

    # 把秒数转换为 Time 对象
    Time.at(time)

    # 返回从纪元以来的秒数，包含微妙
    time = Time.now.to_f

    time.isdst      # => false：如果 UTC 没有 DST（夏令时）
    time.utc?       # => true：如果在 UTC 时区
    time.localtime  # 转换为本地时区
    time.gmtime     # 转换回 UTC
    time.getlocal   # 返回本地区中的一个新的 Time 对象
    time.getutc     # 返回 UTC 中的一个新的 Time 对象
=end

# 格式化时间和日期
puts time.to_s
puts time.ctime
puts time.localtime
puts time.strftime("%Y-%m-%d %H:%M:%S")

=begin
    时间格式化指令
    下表所列出的指令与方法 Time.strftime 一起使用。
        %a  星期几名称的缩写（比如 Sun）。
        %A  星期几名称的全称（比如 Sunday）。
        %b  月份名称的缩写（比如 Jan）。
        %B  月份名称的全称（比如 January）。
        %c  优选的本地日期和时间表示法。
        %d  一个月中的第几天（01 到 31）。
        %H  一天中的第几小时，24 小时制（00 到 23）。
        %I  一天中的第几小时，12 小时制（01 到 12）。
        %j  一年中的第几天（001 到 366）。
        %m  一年中的第几月（01 到 12）。
        %M  小时中的第几分钟（00 到 59）。
        %p  子午线指示（AM 或 PM）。
        %S  分钟中的第几秒（00 或 60）。
        %U  当前年中的周数，从第一个星期日（作为第一周的第一天）开始（00 到 53）。
        %W  当前年中的周数，从第一个星期一（作为第一周的第一天）开始（00 到 53）。
        %w  一星期中的第几天（Sunday 是 0，0 到 6）。
        %x  只有日期没有时间的优先表示法。
        %X  只有时间没有日期的优先表示法。
        %y  不带世纪的年份表示（00 到 99）。
        %Y  带有世纪的年份。
        %Z  时区名称。
        %%  % 字符。
=end


# 时间算法
# 可以用时间做一些简单的算术，如下所示：
now = Time.now           # 当前时间
puts now

past = now - 10          # 10 秒之前。Time - number => Time
puts past

future = now + 10        # 从现在开始 10 秒之后。Time + number => Time
puts future

diff = future - now      # => 10  Time - Time => 秒数
puts diff

exec "whoami"
app_dir = File.expand_path("../..", __FILE__)
puts "aabb  #{app_dir}"
