//
//  TicTacToeBoard.swift
//  TicTacToe
//
//  Created by David Verbenyi on 26/05/2022.
//

import SwiftUI


struct TicTacToeBoard: View {
    var geometryProxy: GeometryProxy
    @StateObject var viewModel: TicTacToeViewModel
    
    var body: some View {
        LazyVGrid(columns: viewModel.columns) {
            ForEach(0 ..< 9) { i in
                ZStack {
                    GameField(proxy: geometryProxy)
                    PlayerIndicator(playerIcon: viewModel.moves[i]?.indicator ?? "")
                }
                .onTapGesture {
                    viewModel.processPlayerMoves(for: i)
                    
                }
            }
            .disabled(viewModel.boardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {
                    viewModel.resetGame()
                }))
            }
        }
    }    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            TicTacToeBoard(geometryProxy: geometry, viewModel: TicTacToeViewModel(difficulty: .hard))
        }
    }
}
