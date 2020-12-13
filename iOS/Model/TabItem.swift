//
//  TabItem.swift
//  DigitalWalletApp (iOS)
//
//  Created by Raphael Cerqueira on 12/12/20.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID().uuidString
    var image: String
}

let tabItems = [
    TabItem(image: "house.fill"),
    TabItem(image: "square.grid.2x2.fill"),
    TabItem(image: "chart.pie.fill"),
    TabItem(image: "gearshape.fill")
]
