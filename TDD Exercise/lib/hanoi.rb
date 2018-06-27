class Hanoi
  attr_accessor :discs
  
  def initialize
    @discs = Array.new(3) { Array.new }
    discs[0].concat([3,2,1])
  end
  
  def move_disc(move)
    from, to = move
    discs[to] << discs[from].pop
  end
  
  def won? 
    return true if discs[0].empty? && (discs[1].empty? || discs[2].empty?)
    false
  end
  
  def get_input
    while true
      p "Please choose a tower to take a disk from: "
      from = STDIN.gets.to_i
      p "Please choose a destination tower: "
      to = STDIN.gets.to_i
      return [from, to] if valid_move?([from, to])
      p "Please try again!"
    end
  end
  
  def take_turn
    move_disc(get_input)
  end
  
  def play
    until won?
      system("clear")
      p discs
      take_turn
    end
    p "Congratulations! You won!"
  end
  
  def valid_move?(move)
    from, to = move
    if discs[to].nil? || discs[from].nil?
      return false
    elsif discs[from].empty?
      return false
    elsif discs[to].empty?
      return true
    elsif discs[to].last < discs[from].last
      return false
    end
    true 
  end
  
end

if $PROGRAM_NAME == __FILE__
  game = Hanoi.new
  game.play
end