class Player

  attr_accessor :lives
  attr_reader :name

  def initialize(name)
    @name = name
    @lives = 3
  end

  def wrong_answer
    @lives -= 1
  end
  
end



