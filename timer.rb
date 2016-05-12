user_input = Thread.new do
  print "Enter something: "
  Thread.current[:value] = gets.chomp
end

timer = Thread.new { sleep 3; user_input.kill; puts }

user_input.join
if user_input[:value]
  puts "User entered #{user_input[:value]}"
else
  puts "Timer expired"
end
