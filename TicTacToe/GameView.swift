//
//  GameView.swift
//  TicTacToe
//
//  Created by David Verbenyi on 27/05/2022.
//

import SwiftUI

struct GameView: View {
    var difficulty: Difficulty
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(difficulty())
                    .font(.title)
                TicTacToeBoard(geometryProxy: geometry,
                               viewModel: TicTacToeViewModel(difficulty: difficulty))
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(difficulty: Difficulty.medium)
    }
}
