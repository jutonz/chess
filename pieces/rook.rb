require_relative 'chess_piece'

class Rook < ChessPiece
  def initialize
    super
    moves_to :left,   :infinitely
    moves_to :right,  :infinitely
    moves_to :bottom, :infinitely
    moves_to :top,    :infinitely
  end

end