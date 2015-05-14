require_relative 'spec_helper'

describe Chess do
  before :each do
    @chess = Chess.new
  end

  it 'calculates valid moves for the king' do
    moves = @chess.valid_moves_for 'king', 'b2'

    expect(moves.include? 'a1').to be true
    expect(moves.include? 'b1').to be true
    expect(moves.include? 'c1').to be true

    expect(moves.include? 'a2').to be true
    expect(moves.include? 'c2').to be true

    expect(moves.include? 'a3').to be true
    expect(moves.include? 'b3').to be true
    expect(moves.include? 'c3').to be true

    expect(moves.length).to be 8
  end

  it 'calculates valid moves for the rook' do
    moves = @chess.valid_moves_for 'rook', 'd5'

    expect(moves.include? 'a5').to be true
    expect(moves.include? 'b5').to be true
    expect(moves.include? 'c5').to be true

    expect(moves.include? 'e5').to be true
    expect(moves.include? 'f5').to be true
    expect(moves.include? 'g5').to be true
    expect(moves.include? 'h5').to be true

    expect(moves.include? 'd1').to be true
    expect(moves.include? 'd2').to be true
    expect(moves.include? 'd3').to be true
    expect(moves.include? 'd4').to be true

    expect(moves.include? 'd6').to be true
    expect(moves.include? 'd7').to be true
    expect(moves.include? 'd8').to be true

    expect(moves.length).to be 14
  end

  it 'calculates valid moves for the knight' do
    moves = @chess.valid_moves_for 'knight', 'd4'

    expect(moves.include? 'c6').to be true
    expect(moves.include? 'e6').to be true

    expect(moves.include? 'b5').to be true
    expect(moves.include? 'b3').to be true

    expect(moves.include? 'c2').to be true
    expect(moves.include? 'e2').to be true

    expect(moves.include? 'f3').to be true
    expect(moves.include? 'f5').to be true

    expect(moves.length).to eq 8
  end

  it 'calculates valid moves for the knight in a corner' do
    moves = @chess.valid_moves_for 'knight', 'a1'

    expect(moves.include? 'c2').to be true
    expect(moves.include? 'b3').to be true

    expect(moves.length).to eq 2
  end

  it 'calculates valid moves for the queen' do 
    moves = @chess.valid_moves_for 'queen', 'd4'

    expect(moves.include? 'a1').to be true
    expect(moves.include? 'b2').to be true
    expect(moves.include? 'c3').to be true

    expect(moves.include? 'd3').to be true
    expect(moves.include? 'd2').to be true
    expect(moves.include? 'd1').to be true

    expect(moves.include? 'e3').to be true
    expect(moves.include? 'f2').to be true
    expect(moves.include? 'g1').to be true

    expect(moves.include? 'e4').to be true
    expect(moves.include? 'f4').to be true
    expect(moves.include? 'g4').to be true
    expect(moves.include? 'h4').to be true

    expect(moves.include? 'e5').to be true
    expect(moves.include? 'f6').to be true
    expect(moves.include? 'g7').to be true
    expect(moves.include? 'h8').to be true

    expect(moves.include? 'd5').to be true
    expect(moves.include? 'd6').to be true
    expect(moves.include? 'd7').to be true
    expect(moves.include? 'd8').to be true

    expect(moves.include? 'c5').to be true
    expect(moves.include? 'b6').to be true
    expect(moves.include? 'a7').to be true

    expect(moves.include? 'c4').to be true
    expect(moves.include? 'b4').to be true
    expect(moves.include? 'a4').to be true

    expect(moves.length).to be 27
  end

end