require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
cult1 = Cult.new("dogs", "chicago", 2020, "hey buddy")
cult2= Cult.new("lemon", "chicago", 2001, "woah")
cult3 = Cult.new("smelly", "los angelas", 2001, "yuh")
follower1 = Follower.new("jerry", 12, "oye")
follower2 = Follower.new("timmy", 35, "aye")
follower3 = Follower.new("harold", 2, "woof")
oath1 = BloodOath.new(cult1, follower1)
oath2 = BloodOath.new(cult2, follower2)
oath3 = BloodOath.new(cult1, follower3)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
