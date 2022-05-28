//
//  Difficulty.swift
//  TicTacToe
//
//  Created by David Verbenyi on 27/05/2022.
//

import Foundation

enum Difficulty: String {
    case easy, medium, hard
    
    func callAsFunction() -> String {
        return self.rawValue.capitalized
    }
}
