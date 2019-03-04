class User < Player

  NO_NAME = "Anonim".freeze

  def initialize
    @name = request_name
    super
  end

  def request_name
    print "Your name: "
    name = gets.chomp
    name = NO_NAME if name.to_s.empty?
    name
  end

end