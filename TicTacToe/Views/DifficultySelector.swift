//
//  DifficultySelector.swift
//  TicTacToe
//
//  Created by David Verbenyi on 28/05/2022.
//

import SwiftUI

struct DifficultySelector: View {
    var difficulty: Difficulty
    
    var body: some View {
        NavigationLink(destination: GameView(difficulty: difficulty)) {
            Text(difficulty())
                .font(.title)
                .frame(width: 150, height: 40)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 4)
                )
        }
    }
}

struct DifficultySelector_Previews: PreviewProvider {
    static var previews: some View {
        DifficultySelector(difficulty: .medium)
    }
}
