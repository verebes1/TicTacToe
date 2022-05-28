//
//  Alerts.swift
//  TicTacToe
//
//  Created by David Verbenyi on 26/05/2022.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

enum AlertContext {
    static let humanWin = AlertItem(title: Text("Win"),
                               message: Text("You won you are awesome"),
                               buttonTitle: Text("Oh Yeah"))
    static let draw = AlertItem(title: Text("Draw"),
                               message: Text("Well played game"),
                               buttonTitle: Text("Re-match"))
    static let computerWin = AlertItem(title: Text("You lose"),
                               message: Text("You lost against this great AI"),
                               buttonTitle: Text("Oh no :("))
}
