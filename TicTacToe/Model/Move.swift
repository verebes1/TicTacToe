//
//  Move.swift
//  TicTacToe
//
//  Created by David Verbenyi on 27/05/2022.
//

import Foundation

enum Player {
    case human, computer
}

struct Move {
    var player: Player
    var boardIndex: Int
    
    var indicator: String {
        player == .human ? "xmark" : "circle"
    }
}
