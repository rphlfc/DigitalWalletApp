//
//  MenuItemView.swift
//  DigitalWalletApp (macOS)
//
//  Created by Raphael Cerqueira on 17/12/20.
//

import SwiftUI

struct MenuItemView: View {
    var item: MenuItem
    @Binding var selectedItem: Int
    var index: Int
    
    var body: some View {
        Button(action: {
            selectedItem = index
        }, label: {
            VStack {
                HStack(spacing: 0) {
                    Image(systemName: item.image)
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(item.backgroundColor)
                        .cornerRadius(12)
                        .padding(.leading)
                    
                    Text(item.title)
                        .foregroundColor(.primary)
                        .fontWeight(.medium)
                        .padding(.leading)
                    
                    Spacer()
                }
                .padding(.vertical)
                
                Divider()
                    .padding(.trailing)
            }
        })
        .buttonStyle(PlainButtonStyle())
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(item: MenuItem(image: "house.fill", title: "Dashboard", backgroundColor: Color(#colorLiteral(red: 0.4102070928, green: 0.4138484001, blue: 0.8756496906, alpha: 1))), selectedItem: .constant(0), index: 1)
    }
}
