class ChessPiece
  def initialize
    @valid_moves = []
  end

  def moves_to(direction, times)
    movement_pattern = []
    movement_pattern << generate_move(direction, times)
    moves_according_to movement_pattern
  end

  def moves_according_to(movement_pattern)
    @valid_moves << movement_pattern
  end

  def generate_move(direction, times, dont_tally = false)
    # Generates a movement object used internally to keep track of 
    # how the piece is to move. The optional third parameter can be used
    # to specify that a step or series of intermediate steps be ignored
    # when counting tiles (e.g. so only the final step of the knight's
    # movement is counted) 
    move = Hash.new
    move[:direction] = direction
    move[:times] = case times
      when :once  then 1
      when :twice then 2
      when :infinitely then Float::INFINITY
      else times
    end
    move[:dont_tally] = dont_tally
    return move

  end

  def valid_moves
    @valid_moves
  end

end