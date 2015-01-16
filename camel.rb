#!/usr/bin/env ruby

File.open('url.txt', 'r').each_line do |line|
  line.chomp!
  command = "curl --silent -L #{line}|grep -i x-camel-cur-price|grep amazon"
  reciever = line.gsub(/http\:\/\/camelcamelcamel\.com\//,"").gsub(/\/product.*$/,"")
  puts "---#{reciever}---"
  url = %x[ #{command} ]
  cleaned = url.gsub(/<td style=\"white-space:nowrap;\">\$ <input class=\"price \" type=\"text\" name=\"price\" id=\"dp_amazon\" onfocus=\"change_sub_tab/,"")
  more_clean = cleaned.gsub(/onkeyup=\"check_desired_price_reality\(this\)\;\" \/>/,"").gsub(/^.*-cur-/,"current-").gsub(/x-camel-/,"")
  puts more_clean
  print "\n"
end
