require 'require_all'

require_all 'pieces'
require_relative 'board'

class Chess
  def initialize
    @pieces = ['king', 'knight', 'rook', 'queen'].sort
    @pieces.each do |piece|
      instance_variable_set "@#{piece}", Object::const_get(piece.capitalize).new
    end
    @board = Board.new
  end

  def is_piece(piece)
    @pieces.include? piece
  end

  def valid_moves_for(_piece, starting_location)
    unless @pieces.include? _piece 
      message = "\nSorry, I don't know about that piece (#{_piece}).\n"
      message += "Try asking about any of the following pieces:\n"
      @pieces.each { |piece| message += piece + "\n" }
      raise message + "\n"
    end

    unless @board.is_valid_position(starting_location)
      message = "\nIt doesn't look like \"#{starting_location}\" is a valid position on the board."
      message += "\nThe board's dimensions are #{@board.width} x #{@board.height}.\n"
      raise message + "\n"
    end

    piece = instance_variable_get "@#{_piece}"
    movement_patterns = piece.valid_moves
    @board.position = starting_location

    valid_moves = []
    movement_patterns.each do |pattern|
      potential_moves = @board.pretend_follow_pattern(pattern)
      unless potential_moves.nil?
        potential_moves.each do |move|
          valid_moves << move
        end
      end
    end

    return valid_moves
  end
  
end