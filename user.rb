class User < Player

  def initialize
    @name = request_name
    super
  end

  def request_name
    print "Your name: "
    gets.chomp.capitalize
  end

end