UNFINISHED_BOARD = -1
DRAW = 0

def is_solved(board)
  winner = find_winner(board)
  return winner if winner
  return UNFINISHED_BOARD if board_unfinished(board)
  DRAW
end

def find_winner(board)
  puts "Find Winner: #{board}"
  puts "Verticals: #{verticals(board)}"
  puts "Horizontals: #{horizontals(board)}"
  puts "Diagonals: #{diagonals(board)}"

  verticals(board) || horizontals(board) || diagonals(board)
end

def board_unfinished(board)
  puts "Board Unfinished: #{board}"
  board.flatten.any?(0)
end

# check if we have any verticals that have the same char
def verticals(board)
  return board[0][0] if board[0][0] != 0 && board[0][0] == board[1][0] && board[0][0] == board[2][0]
  return board[0][1] if board[0][1] != 0 && board[0][1] == board[1][1] && board[0][1] == board[2][1]
  return board[0][2] if board[0][2] != 0 && board[0][2] == board[1][2] && board[0][2] == board[2][2]
  false
end

# check if we have horizontals with the same char
def horizontals(board)
  return board[0][0] if board[0][0] != 0 && board[0][0] == board[0][1] && board[0][0] == board[0][2]
  return board[1][0] if board[1][0] != 0 && board[1][0] == board[1][1] && board[1][0] == board[1][2]
  return board[2][0] if board[2][0] != 0 && board[2][0] == board[2][1] && board[2][0] == board[2][2]
  false
end

def diagonals(board)
  return board[0][0] if board[0][0] != 0 && board[0][0] == board[1][1] && board[0][0] == board[2][2]
  return board[0][2] if board[0][2] != 0 && board[0][2] == board[1][1] && board[0][2] == board[2][0]
  false
end
