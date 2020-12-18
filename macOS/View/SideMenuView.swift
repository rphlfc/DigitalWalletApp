//
//  SideMenuView.swift
//  DigitalWalletApp (macOS)
//
//  Created by Raphael Cerqueira on 17/12/20.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            MenuProfileView()
            
            MenuOptionsView()
            
            Spacer()
        }
        .frame(width: 280)
        .padding(.vertical)
        .background(Color("background"))
    }
}

struct MenuOptionsView: View {
    let menuItems = [
        MenuItem(image: "house.fill", title: "Dashboard", backgroundColor: Color(#colorLiteral(red: 0.4102070928, green: 0.4138484001, blue: 0.8756496906, alpha: 1))),
        MenuItem(image: "arrow.right", title: "Send Money", backgroundColor: Color(#colorLiteral(red: 0.1982805431, green: 0.6548774838, blue: 0.8873667121, alpha: 1))),
        MenuItem(image: "square.and.arrow.down.fill", title: "Top up Wallet", backgroundColor: Color(#colorLiteral(red: 0.7113566995, green: 0.2827133238, blue: 0.7766218781, alpha: 1))),
        MenuItem(image: "arrow.down.square", title: "Withdraw", backgroundColor: Color(#colorLiteral(red: 0.1332707107, green: 0.6911456585, blue: 0.491319418, alpha: 1))),
        MenuItem(image: "banknote.fill", title: "Bill Payment", backgroundColor: Color(#colorLiteral(red: 1, green: 0.5288571715, blue: 0, alpha: 1)))
    ]
    
    let otherItems = [
        MenuItem(image: "arrow.up.arrow.down", title: "History Transactions", backgroundColor: Color(#colorLiteral(red: 0.4102070928, green: 0.4138484001, blue: 0.8756496906, alpha: 1))),
        MenuItem(image: "person.2.fill", title: "Request Payment", backgroundColor: Color(#colorLiteral(red: 0.966612041, green: 0.4405148029, blue: 0.4429402351, alpha: 1))),
        MenuItem(image: "chart.pie.fill", title: "Statistics", backgroundColor: Color(#colorLiteral(red: 0.06607601792, green: 0.8028896451, blue: 0.8530395031, alpha: 1))),
        MenuItem(image: "questionmark.circle.fill", title: "Help", backgroundColor: Color(#colorLiteral(red: 0.9978393912, green: 0.7147321105, blue: 0.2809217274, alpha: 1)))
    ]
    
    @State var selectedIndex = 0
    
    var body: some View {
        VStack(spacing: 0) {
            MenuSection(section: "Menu", items: menuItems, selectedIndex: $selectedIndex)
            
            MenuSection(section: "Other Menu", items: otherItems, selectedIndex: $selectedIndex, offset: 5)
        }
    }
}

struct MenuSection: View {
    var section: String
    var items: [MenuItem]
    
    @Binding var selectedIndex: Int
    
    var offset: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(section)
                .foregroundColor(Color.gray)
                .fontWeight(.medium)
                .padding(.leading)
                .padding(.vertical)
            
            ForEach(0 ..< items.count) { i in
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(selectedIndex == i + offset ? items[i].backgroundColor : Color("background"))
                        .frame(width: 3)
                        .frame(maxHeight: .infinity)
                    
                    MenuItemView(item: items[i], selectedItem: $selectedIndex, index: i + offset)
                }
                .background(selectedIndex == i + offset ? Color("foreground") : Color("background"))
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
