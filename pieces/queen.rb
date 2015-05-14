class Queen < ChessPiece
  def initialize
    super
    moves_to :left,   :infinitely
    moves_to :right,  :infinitely
    moves_to :top,    :infinitely
    moves_to :bottom, :infinitely

    moves_to :top_left,     :infinitely
    moves_to :top_right,    :infinitely
    moves_to :bottom_left,  :infinitely
    moves_to :bottom_right, :infinitely
  end

end