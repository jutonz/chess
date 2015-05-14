require_relative 'spec_helper'

describe Board do 
  before :each do 
    # @board = Board.new
  end

  it 'accepts a height and a width parameter' do
    board = Board.new 1, 2
    expect(board.width).to equal(1)
    expect(board.height).to equal(2)
  end

  it 'defaults to a regular chess board (8x8)' do
    board = Board.new
    expect(board.width).to equal(8)
    expect(board.height).to equal(8)
  end

  it 'allows you to set a position in standard chess format (e.g. d2)' do
    board = Board.new
    board.position= 'd2'
    expect(board.position).to eq('d2')
  end

  it 'does not have a position unless one has been previously set' do
    board = Board.new
    expect(board.position).to be_nil
  end

  it 'can determine whether a specified position is valid' do
    board = Board.new 
    
    position = 'a1'
    expect(board.is_valid_position(position)).to be true

    position = 'h8'
    expect(board.is_valid_position(position)).to be true

    position = 'h0'
    expect(board.is_valid_position(position)).to be false
  
    position = 'h'
    expect(board.is_valid_position(position)).to be false
  end

  describe '#pretend_move_by' do 
    it 'handles moving from the middle of the board' do
      board = Board.new
      board.position = 'e4'
      expect(board.position).to eq('e4') # Sanity check.
      expect(board.position_to :left).to   eq('d4')
      expect(board.position_to :right).to  eq('f4')
      expect(board.position_to :top).to    eq('e5')
      expect(board.position_to :bottom).to eq('e3')

      expect(board.position_to :top_left).to     eq('d5')
      expect(board.position_to :top_right).to    eq('f5')
      expect(board.position_to :bottom_left).to  eq('d3')
      expect(board.position_to :bottom_right).to eq('f3')
    end

    it 'handles moving from the left side of the board' do
      board = Board.new
      board.position = 'a4'
      expect(board.position).to eq('a4') # Sanity check.
      expect(board.position_to :left).to   be_nil
      expect(board.position_to :right).to  eq('b4')
      expect(board.position_to :top).to    eq('a5')
      expect(board.position_to :bottom).to eq('a3')

      expect(board.position_to :top_left).to     be_nil
      expect(board.position_to :top_right).to    eq('b5')
      expect(board.position_to :bottom_left).to  be_nil
      expect(board.position_to :bottom_right).to eq('b3')
    end

    it 'handles moving from the right side of the board' do
      board = Board.new
      board.position = 'h4'
      expect(board.position).to eq('h4') # Sanity check.
      expect(board.position_to :left).to   eq('g4')
      expect(board.position_to :right).to  be_nil
      expect(board.position_to :top).to    eq('h5')
      expect(board.position_to :bottom).to eq('h3')

      expect(board.position_to :top_left).to     eq('g5')
      expect(board.position_to :top_right).to    be_nil
      expect(board.position_to :bottom_left).to  eq('g3')
      expect(board.position_to :bottom_right).to be_nil
    end

    it 'handles moving from the top side of the board' do
      board = Board.new
      board.position = 'e8'
      expect(board.position).to eq('e8') # Sanity check.
      expect(board.position_to :left).to   eq('d8')
      expect(board.position_to :right).to  eq('f8')
      expect(board.position_to :top).to    be_nil
      expect(board.position_to :bottom).to eq('e7')

      expect(board.position_to :top_left).to     be_nil
      expect(board.position_to :top_right).to    be_nil
      expect(board.position_to :bottom_left).to  eq('d7')
      expect(board.position_to :bottom_right).to eq('f7')
    end

    it 'handles moving from the bottom side of the board' do
      board = Board.new
      board.position = 'e1'
      expect(board.position).to eq('e1') # Sanity check.
      expect(board.position_to :left).to   eq('d1')
      expect(board.position_to :right).to  eq('f1')
      expect(board.position_to :top).to    eq('e2')
      expect(board.position_to :bottom).to be_nil

      expect(board.position_to :top_left).to     eq('d2')
      expect(board.position_to :top_right).to    eq('f2')
      expect(board.position_to :bottom_left).to  be_nil
      expect(board.position_to :bottom_right).to be_nil
    end

    it 'handles moving from the top left corner of the board' do
      board = Board.new
      board.position = 'a8'
      expect(board.position).to eq('a8') # Sanity check.
      expect(board.position_to :left).to   be_nil
      expect(board.position_to :right).to  eq('b8')
      expect(board.position_to :top).to    be_nil
      expect(board.position_to :bottom).to eq('a7')

      expect(board.position_to :top_left).to     be_nil
      expect(board.position_to :top_right).to    be_nil
      expect(board.position_to :bottom_left).to  be_nil
      expect(board.position_to :bottom_right).to eq('b7')
    end

    it 'handles moving from the top right corner of the board' do
      board = Board.new
      board.position = 'h8'
      expect(board.position).to eq('h8') # Sanity check.
      expect(board.position_to :left).to   eq('g8')
      expect(board.position_to :right).to  be_nil
      expect(board.position_to :top).to    be_nil
      expect(board.position_to :bottom).to eq('h7')

      expect(board.position_to :top_left).to     be_nil
      expect(board.position_to :top_right).to    be_nil
      expect(board.position_to :bottom_left).to  eq('g7')
      expect(board.position_to :bottom_right).to be_nil
    end

    it 'handles moving from the bottom left corner of the board' do
      board = Board.new
      board.position = 'a1'
      expect(board.position).to eq('a1') # Sanity check.
      expect(board.position_to :left).to   be_nil
      expect(board.position_to :right).to  eq('b1')
      expect(board.position_to :top).to    eq('a2')
      expect(board.position_to :bottom).to be_nil

      expect(board.position_to :top_left).to     be_nil
      expect(board.position_to :top_right).to    eq('b2')
      expect(board.position_to :bottom_left).to  be_nil
      expect(board.position_to :bottom_right).to be_nil
    end

    it 'handles moving from the bottom right corner of the board' do
      board = Board.new
      board.position = 'h1'
      expect(board.position).to eq('h1') # Sanity check.
      expect(board.position_to :left).to   eq('g1')
      expect(board.position_to :right).to  be_nil
      expect(board.position_to :top).to    eq('h2')
      expect(board.position_to :bottom).to be_nil

      expect(board.position_to :top_left).to     eq('g2')
      expect(board.position_to :top_right).to    be_nil
      expect(board.position_to :bottom_left).to  be_nil
      expect(board.position_to :bottom_right).to be_nil
    end

  end

  describe '#pretend_follow_pattern' do

    it 'follows the knight movement pattern' do
      movement_pattern = []
      piece = ChessPiece.new

      movement_pattern << piece.generate_move(:top, :twice, true)
      movement_pattern << piece.generate_move(:right, :once)
      piece.moves_according_to movement_pattern

      board = Board.new
      board.position = 'd4'

      expect(board.pretend_follow_pattern(piece.valid_moves[0])).to eq(['e6'])
    end

  end

end