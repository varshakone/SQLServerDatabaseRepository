import itertools
n = int(input("Enter board size: "))
board = list(input().strip() for i in range(n))
def minimumMoves(n, board):
    queens = []
    for column in range(n):
        for row in range(n):
            if board[row][column] == 'Q':
                queens.append(row)
                break
    permutations = list(itertools.permutations(range(n)))
    min_moves = float('inf')
    for permutation in permutations:
        moves = 0
        for column in range(n):
            moves += abs(queens[column] - permutation[column])
        min_moves = min(min_moves, moves)
    return min_moves
print(minimumMoves(n, board))