require_relative 'util'

class Board
  def initialize(width = 8, height = 8)
    @width  = width
    @height = height
  end

  def width
    @width
  end

  def height
    @height
  end

  def position
    get_position
  end

  def position=(new_position) # in the format a1, b1, c4, et cetera
    set_position(new_position)
  end
  
  def position_to(direction)
    case direction
    when :left
      pretend_move_by -1, 0
    when :right
      pretend_move_by 1, 0
    when :top
      pretend_move_by 0, 1
    when :bottom
      pretend_move_by 0, -1
    when :top_right
      pretend_move_by 1, 1
    when :top_left
      pretend_move_by -1, 1
    when :bottom_left
      pretend_move_by -1, -1
    when :bottom_right
      pretend_move_by 1, -1
    else
      raise "#{direction} is not a valid direction"
    end
  end

  def pretend_move_by(moves_x, moves_y)
    # Pretend to move from the current position in the specified direction.
    # If successful, returns the spot to which the piece would have moved.
    # Otherwise returns nil. Does not actually update the position.
    pretend_x = @position_x
    pretend_y = @position_y

    pretend_x += moves_x
    pretend_y += moves_y

    return nil if pretend_x <= 0 or pretend_x > @width
    return nil if pretend_y <= 0 or pretend_y > @height

    pretend_x = Util.to_ascii(pretend_x)

    pretend_position = pretend_x << "#{pretend_y}" # << performs concatenation in memory (faster than +)
  end

  def is_valid_position(position)
    return false if position.length != 2

    position_x = position[0]
    position_y = position[1]

    position_x = Util.to_ordinal(position_x)
    position_y = position_y.to_i # Want to force storage as Fixnum

    return false if position_x <= 0 or position_x > @width
    return false if position_y <= 0 or position_y > @height

    return true
  end

  def pretend_follow_pattern(movement_pattern)
    # Tells you where the movement pattern will take you, including
    # all steps along the way. 
    # Returns nil only if the pattern goes off the board AND all 
    # intermediate steps had their dont_tally attribute set
    starting_position = position
    squares_along_path = []
    hit_edge = false

    movement_pattern.each do |move|

      1.upto move[:times] do
        next if hit_edge

        next_position = position_to move[:direction]
        if next_position.nil?
          hit_edge = true
          break
        end

        set_position next_position

        squares_along_path << next_position unless move[:dont_tally]
    
      end

    end

    set_position starting_position
    return squares_along_path

  end

  private

  def set_position(new_position)
    if new_position.nil?
      @position_x = nil
      @position_y = nil
      return nil
    end

    position_x = new_position[0]
    position_y = new_position[1]

    @position_x = Util.to_ordinal(position_x)
    @position_y = position_y.to_i # Want to force storage as Fixnum
  end

  def get_position
    return nil unless @position_x && @position_y
    Util.to_ascii(@position_x) + "#{@position_y}"
  end

end