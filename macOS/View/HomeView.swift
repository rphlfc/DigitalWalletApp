//
//  HomeView.swift
//  DigitalWalletApp (macOS)
//
//  Created by Raphael Cerqueira on 17/12/20.
//

import SwiftUI

struct HomeView: View {
    var window = NSScreen.main?.visibleFrame
    
    let dashboardMenuItems = [
        MenuItem(image: "arrow.right", title: "Transfer", backgroundColor: Color(#colorLiteral(red: 0.1982805431, green: 0.6548774838, blue: 0.8873667121, alpha: 1))),
        MenuItem(image: "square.and.arrow.down.fill", title: "Top-up", backgroundColor: Color(#colorLiteral(red: 0.7113566995, green: 0.2827133238, blue: 0.7766218781, alpha: 1))),
        MenuItem(image: "banknote.fill", title: "Bill", backgroundColor: Color(#colorLiteral(red: 1, green: 0.5288571715, blue: 0, alpha: 1))),
    ]
    
    var body: some View {
        HStack {
            SideMenuView()
            
            VStack {
                HStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        Text("Your Balance")
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                        
                        Text("Rp 8.250.000")
                            .font(.largeTitle)
                            .foregroundColor(Color("accent"))
                            .padding(.top, 8)
                    }
                    
                    Spacer()
                    
                    ForEach(0 ..< dashboardMenuItems.count) { i in
                        VerticalMenuItemView(item: dashboardMenuItems[i])
                            .padding()
                    }
                }
                .padding()
                
                Divider()
                    .padding(.leading)
                
                //LatestTransactionsView()
                
                Spacer()
            }
        }
        .frame(width: window!.width / 1.2, height: window!.height - 50)
        .background(Color("foreground"))
        .preferredColorScheme(.light)
    }
}

struct LatestTransactionsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Latest Transactions")
                .font(.title2)
                .foregroundColor(.primary)
                .fontWeight(.medium)
                .padding(.leading)
            
            ScrollView(.vertical, showsIndicators: false, content: {
                ForEach(0..<transactionItems.count) { i in
                    TransactionItemView(item: transactionItems[i])
                }
            })
        }
    }
}

struct TransactionItemView: View {
    var item: TransactionItem
    
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: item.image)
                .font(.title2)
                .foregroundColor(item.foregroundColor)
                .frame(width: 50, height: 50)
                .background(item.backgroundColor)
                .cornerRadius(13)
            
            Text(item.title)
                .foregroundColor(Color.primary)
                .fontWeight(.bold)
                .padding(.leading)
            
            Spacer()
            
            Text(item.date)
                .foregroundColor(Color.primary.opacity(0.4))
            
            Spacer()
            
            Text(item.description)
                .foregroundColor(Color.primary.opacity(0.4))
            
            Spacer()
            
            Text(item.value)
                .foregroundColor(Color.primary)
                .fontWeight(.bold)
        }
        .padding()
    }
}

struct VerticalMenuItemView: View {
    var item: MenuItem
    
    var body: some View {
        Button(action: {}, label: {
            VStack {
                Image(systemName: item.image)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(item.backgroundColor)
                    .cornerRadius(22)
                
                Text(item.title)
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
                    .padding(.top, 4)
            }
        })
        .buttonStyle(PlainButtonStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
    }
}
