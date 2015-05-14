require_relative '../spec_helper'

describe ChessPiece do
  before :each do
    @piece = ChessPiece.new
  end

  it 'stores valid moves' do
    @piece.moves_to :left, :once
    @piece.moves_to :top_right, :twice
    @piece.moves_to :right, 5

    moves = @piece.valid_moves
    expect(moves[0][0][:direction]).to eq(:left)
    expect(moves[0][0][:times]).to equal(1)

    expect(moves[1][0][:direction]).to eq(:top_right)
    expect(moves[1][0][:times]).to equal(2)

    expect(moves[2][0][:direction]).to eq(:right)
    expect(moves[2][0][:times]).to equal(5)
  end

  it 'stores infinite movement times' do
    @piece.moves_to :left, :infinitely
    moves = @piece.valid_moves

    expect(moves[0][0][:direction]).to eq(:left)
    expect(moves[0][0][:times]).to equal(Float::INFINITY)
  end

  it 'has no default valid moves' do
    expect(@piece.valid_moves).to eq([])
  end

  it 'stores movement patterns' do
    movement_pattern = []
    movement_pattern << @piece.generate_move(:top, :twice)
    movement_pattern << @piece.generate_move(:right, :once)

    @piece.moves_according_to movement_pattern

    expect(@piece.valid_moves).to eq([movement_pattern])
  end

end