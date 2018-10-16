class String
  def is_upper?
    self == self.upcase
  end

  def is_lower?
    self == self.downcase
  end
end

answer =

while answer.is_lower?
  puts "Welcome to Ruby Burger! We have specials on Hamburgers, Fish Filet, and Cookies for a dollar. Can I take your order?"
  answer = gets.chomp
  puts "Im sorry youll have to speak up maam"

end