//
//  PlayerIndicator.swift
//  TicTacToe
//
//  Created by David Verbenyi on 27/05/2022.
//

import SwiftUI

struct PlayerIndicator: View {
    var playerIcon: String
    
    var body: some View {
        Image(systemName: playerIcon)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}
struct PlayerIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.red
            VStack {
                PlayerIndicator(playerIcon: "xmark")
                PlayerIndicator(playerIcon: "circle")
            }
        }
    }
}
