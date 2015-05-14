require_relative 'chess'

chess = Chess.new
if ARGV[0] and ARGV[1]
  begin
    moves = chess.valid_moves_for ARGV[0], ARGV[1]
    puts moves.sort.join(', ')
  rescue Exception => e
    puts e.message
  end
else 
  puts 'Usage: ruby run.rb <chess_piece> <starting_position>'
  puts 'e.g. ruby run.rb queen d4'
end