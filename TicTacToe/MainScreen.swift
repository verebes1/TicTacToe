//
//  MainScreen.swift
//  TicTacToe
//
//  Created by David Verbenyi on 27/05/2022.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Tic Tac Toe")
                    .font(.title)
                DifficultySelector(difficulty: Difficulty.easy)
                DifficultySelector(difficulty: Difficulty.medium)
                DifficultySelector(difficulty: Difficulty.hard)
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

