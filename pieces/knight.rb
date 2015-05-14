class Knight < ChessPiece
  def initialize
    super
    apply_knight_movement_pattern(:top, :left)
    apply_knight_movement_pattern(:top, :right)

    apply_knight_movement_pattern(:left, :top)
    apply_knight_movement_pattern(:left, :bottom)

    apply_knight_movement_pattern(:bottom, :left)
    apply_knight_movement_pattern(:bottom, :right)

    apply_knight_movement_pattern(:right, :top)
    apply_knight_movement_pattern(:right, :bottom)
  end

  private

  def apply_knight_movement_pattern(long_direction, short_direction)
    movement_pattern = []
    movement_pattern << generate_move(long_direction, :twice, true)
    movement_pattern << generate_move(short_direction, :once)
    moves_according_to movement_pattern
  end
end