//
//  GameField.swift
//  TicTacToe
//
//  Created by David Verbenyi on 27/05/2022.
//

import SwiftUI

struct GameField: View {
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(.red)
            .frame(width: proxy.size.width / 3 - 15, height: proxy.size.width / 3 - 15)
    }
}

struct GameField_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            GameField(proxy: geometry)
        }
    }
}
