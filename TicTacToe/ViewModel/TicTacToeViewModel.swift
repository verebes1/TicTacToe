//
//  TicTacToeViewModel.swift
//  TicTacToe
//
//  Created by David Verbenyi on 27/05/2022.
//

import SwiftUI

final class TicTacToeViewModel: ObservableObject {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),
    ]
    
    // Initialise it to nils as noone made a move initially, when player taps on a circle check if it is nil and only then allow to make a move.
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var boardDisabled = false
    @Published var alertItem: AlertItem?
    
    var difficulty: Difficulty
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
    }
    
    // MARK: - Game logic methods
    func processPlayerMoves(for position: Int) {
        if isSquareOccupied(in: moves, forIndex: position) { return }
        moves[position] = Move(player: .human, boardIndex: position)
        
        // check for win conditions
        if checkWinCondition(for: .human, in: moves) {
            alertItem = AlertContext.humanWin
            return
        }
        
        if checkForDraw(in: moves) {
            alertItem = AlertContext.draw
            return
        }
        
        boardDisabled = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            let computerMoveIndex = determineComputerMovePosition(in: moves)
            moves[computerMoveIndex] = Move(player: .computer, boardIndex: computerMoveIndex)
            
            boardDisabled = false
            
            if checkWinCondition(for: .computer, in: moves) {
                alertItem = AlertContext.computerWin
                return
            }

            if checkForDraw(in: moves) {
                alertItem = AlertContext.draw
            }
        }
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves[index] != nil
    }
    
    func determineComputerMovePosition(in moves: [Move?]) -> Int {
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                                          [0, 3, 6], [1, 4, 7], [2, 5, 8],
                                          [0, 4, 8], [2, 4, 6]]
        
        // Check if can win and take that position
        if difficulty == .hard {
            let computerMoves = moves.compactMap{ $0 }.filter{ $0.player == .computer }
            let computerPositions = Set(computerMoves.map{ $0.boardIndex })
            for pattern in winPatterns {
                let winPosition = pattern.subtracting(computerPositions)
                if winPosition.count == 1 {
                    let isAvailable = !isSquareOccupied(in: moves, forIndex: winPosition.first!)
                    if isAvailable {
                        return winPosition.first!
                    }
                }
            }
        }
        
        // Check if can block and take that position
        if difficulty == .hard || difficulty == .medium {
            let humanMoves = moves.compactMap{ $0 }.filter{ $0.player == .human }
            let humanPositions = Set(humanMoves.map{ $0.boardIndex })
            for pattern in winPatterns {
                let blockPosition = pattern.subtracting(humanPositions)
                if blockPosition.count == 1 {
                    let isAvailable = !isSquareOccupied(in: moves, forIndex: blockPosition.first!)
                    if isAvailable {
                        return blockPosition.first!
                    }
                }
            }
        }
        // Check if middle square is available and take it
        if difficulty == .hard || difficulty == .medium {
            let middleSquare = 4
            if !isSquareOccupied(in: moves, forIndex: middleSquare) {
                return middleSquare
            }
        }
        
        // Random move if all possibilities exhausted
        var movePosition = Int.random(in: 0 ..< 9)
        
        while isSquareOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0 ..< 9)
        }
        
        return movePosition
    }
    
    func checkWinCondition(for player: Player, in moves: [Move?]) -> Bool {
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                                          [0, 3, 6], [1, 4, 7], [2, 5, 8],
                                          [0, 4, 8], [2, 4, 6]]
        // Compact map gets rid of the nil values and filter only leaves elements that match passed in player
        let playerMoves = moves.compactMap{ $0 }.filter{ $0.player == player }
        // We map the boardindexes only from player moves and make a set out of it.
        let playerPositions = Set(playerMoves.map{ $0.boardIndex })
        
        for pattern in winPatterns where pattern.isSubset(of: playerPositions) {
            return true
        }
        
        return false
    }
    
    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap{ $0 }.count == 9
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
    }
}
