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
    
    @State var selectedIndex = 0
    @State var boxVisible = false
    @State var selectedHeight: CGFloat = 0.0
    
    var body: some View {
        HStack {
            SideMenuView()
            
            VStack {
                ZStack(alignment: .bottomLeading) {
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
                        
                        SpendingActivityView(selectedIndex: $selectedIndex, boxVisible: $boxVisible, selectedHeight: $selectedHeight)
                            .padding(.horizontal)
                            .padding(.top)
                    }
                    
                    if boxVisible {
                        MessageBox()
                            .offset(x: CGFloat(selectedIndex * 74), y: -selectedHeight - 35)
                    }
                }
                
                LatestTransactionsView()
                    .padding(.top)
                
                Spacer()
            }
        }
        .frame(width: window!.width / 1.2, height: window!.height - 50)
        .background(Color("foreground"))
        .preferredColorScheme(.light)
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
