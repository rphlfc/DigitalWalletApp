//
//  MenuItem.swift
//  DigitalWalletApp (iOS)
//
//  Created by Raphael Cerqueira on 12/12/20.
//

import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID().uuidString
    var image: String
    var title: String
    var backgroundColor: Color
}

let menuItems = [
    MenuItem(image: "arrow.forward", title: "Transfer", backgroundColor: Color(#colorLiteral(red: 0.1982805431, green: 0.6548774838, blue: 0.8873667121, alpha: 1))),
    MenuItem(image: "square.and.arrow.down.fill", title: "Top-up", backgroundColor: Color(#colorLiteral(red: 0.7113566995, green: 0.2827133238, blue: 0.7766218781, alpha: 1))),
    MenuItem(image: "banknote.fill", title: "Bill", backgroundColor: Color(#colorLiteral(red: 1, green: 0.5288571715, blue: 0, alpha: 1))),
    MenuItem(image: "square.grid.2x2.fill", title: "More", backgroundColor: Color(#colorLiteral(red: 0.1332707107, green: 0.6911456585, blue: 0.491319418, alpha: 1)))
]
