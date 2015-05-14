require_relative 'chess_piece'

class King < ChessPiece
  def initialize
    super
    moves_to :left,   :once
    moves_to :right,  :once
    moves_to :top,    :once
    moves_to :bottom, :once

    moves_to :top_left,     :once
    moves_to :top_right,    :once
    moves_to :bottom_left,  :once
    moves_to :bottom_right, :once
  end
end