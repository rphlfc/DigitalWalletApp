//
//  TransactionItem.swift
//  DigitalWalletApp (iOS)
//
//  Created by Raphael Cerqueira on 12/12/20.
//

import SwiftUI

struct TransactionItem: Identifiable {
    let id = UUID().uuidString
    var backgroundColor: Color
    var foregroundColor: Color
    var image: String
    var title: String
    var date: String
    var value: String
    var description: String
}

let transactionItems = [
    TransactionItem(backgroundColor: Color(#colorLiteral(red: 0.9213595986, green: 0.9698325992, blue: 0.9907643199, alpha: 1)), foregroundColor: Color(#colorLiteral(red: 0.1982805431, green: 0.6548774838, blue: 0.8873667121, alpha: 1)), image: "cart.fill", title: "Grocery", date: "Nov 17", value: "326.800", description: "Minimarket Anugrah"),
    TransactionItem(backgroundColor: Color(#colorLiteral(red: 0.9727268815, green: 0.9269791842, blue: 0.9802276492, alpha: 1)), foregroundColor: Color(#colorLiteral(red: 0.7113566995, green: 0.2827133238, blue: 0.7766218781, alpha: 1)), image: "radio.fill", title: "Entertainment", date: "Nov 17", value: "326.800", description: "Football Game"),
    TransactionItem(backgroundColor: Color(#colorLiteral(red: 1, green: 0.9522336125, blue: 0.9000359178, alpha: 1)), foregroundColor: Color(#colorLiteral(red: 1, green: 0.5288571715, blue: 0, alpha: 1)), image: "camera.fill", title: "Equipaments", date: "Nov 17", value: "326.800", description: "DSLR Camera"),
    TransactionItem(backgroundColor: Color(#colorLiteral(red: 0.9156600237, green: 0.9707886577, blue: 0.9477606416, alpha: 1)), foregroundColor: Color(#colorLiteral(red: 0.1332707107, green: 0.6911456585, blue: 0.491319418, alpha: 1)), image: "briefcase.fill", title: "Office Items", date: "Nov 17", value: "326.800", description: "Stationary"),
    TransactionItem(backgroundColor: Color(#colorLiteral(red: 0.9213595986, green: 0.9698325992, blue: 0.9907643199, alpha: 1)), foregroundColor: Color(#colorLiteral(red: 0.1982805431, green: 0.6548774838, blue: 0.8873667121, alpha: 1)), image: "cart.fill", title: "Grocery", date: "Nov 17", value: "326.800", description: "Minimarket Anugrah"),
    TransactionItem(backgroundColor: Color(#colorLiteral(red: 0.9727268815, green: 0.9269791842, blue: 0.9802276492, alpha: 1)), foregroundColor: Color(#colorLiteral(red: 0.7113566995, green: 0.2827133238, blue: 0.7766218781, alpha: 1)), image: "radio", title: "Entertainment", date: "Nov 17", value: "326.800", description: "Football Game"),
    TransactionItem(backgroundColor: Color(#colorLiteral(red: 1, green: 0.9522336125, blue: 0.9000359178, alpha: 1)), foregroundColor: Color(#colorLiteral(red: 1, green: 0.5288571715, blue: 0, alpha: 1)), image: "camera", title: "Equipments", date: "Nov 17", value: "326.800", description: "DSLR Camera"),
    TransactionItem(backgroundColor: Color(#colorLiteral(red: 0.9156600237, green: 0.9707886577, blue: 0.9477606416, alpha: 1)), foregroundColor: Color(#colorLiteral(red: 0.1332707107, green: 0.6911456585, blue: 0.491319418, alpha: 1)), image: "briefcase.fill", title: "Office Items", date: "Nov 17", value: "326.800", description: "Stationary")
]
