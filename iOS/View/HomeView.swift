//
//  HomeView.swift
//  DigitalWalletApp (iOS)
//
//  Created by Raphael Cerqueira on 12/12/20.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTabIndex = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background")
                    .ignoresSafeArea(.all, edges: .top)
                
                VStack {
                    Text("Your Balance")
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                        .foregroundColor(Color.primary.opacity(0.4))
                        .padding(.top, 30)
                    
                    Text("Rp 8.250.000")
                        .font(.system(size: 36))
                        .foregroundColor(Color.primary)
                        .padding(.top)
                    
                    HStack {
                        ForEach(menuItems) { item in
                            HStack {
                                Spacer(minLength: 0)
                                
                                NavigationLink(
                                    destination: TransferView(),
                                    label: {
                                        VStack {
                                            Image(systemName: item.image)
                                                .font(.title)
                                                .foregroundColor(.white)
                                                .frame(width: 60, height: 60)
                                                .background(item.backgroundColor)
                                                .cornerRadius(23)
                                            
                                            Text(item.title)
                                                .foregroundColor(Color.primary.opacity(0.7))
                                                .padding(.top, 8)
                                        }
                                    }
                                )
                                
                                Spacer(minLength: 0)
                            }
                        }
                    }
                    .padding(.top, 30)
                    
                    VStack {
                        Capsule()
                            .fill(Color("background"))
                            .frame(width: 120, height: 6)
                            .padding(.top, 12)
                        
                        HStack {
                            Text("Transactions")
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                                .foregroundColor(Color.primary.opacity(0.4))
                                .padding(.top)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        .padding(.top, 12)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                ForEach(transactionItems) { item in
                                    HStack(spacing: 0) {
                                        Image(systemName: item.image)
                                            .font(.title2)
                                            .foregroundColor(item.foregroundColor)
                                            .frame(width: 50, height: 50)
                                            .background(item.backgroundColor)
                                            .cornerRadius(13)
                                        
                                        VStack(alignment: .leading) {
                                            Text(item.title)
                                                .foregroundColor(Color.primary)
                                                .fontWeight(.bold)
                                            
                                            Text(item.date)
                                                .foregroundColor(Color.primary.opacity(0.4))
                                        }
                                        .padding(.leading)
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing) {
                                            Text(item.value)
                                                .foregroundColor(Color.primary)
                                                .fontWeight(.bold)
                                            
                                            Text(item.description)
                                                .foregroundColor(Color.primary.opacity(0.4))
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                        .padding(.bottom, 100)
                    }
                    .background(Color("foreground"))
                    .cornerRadius(40)
                    .padding(.top, 30)
                    
                    Spacer()
                }
                .ignoresSafeArea(.all, edges: .bottom)
                
                // Tabs
                VStack {
                    Spacer()
                    
                    HStack(spacing: 0) {
                        ForEach(0 ..< tabItems.count) { i in
                            Button(action: {
                                selectedTabIndex = i
                            }, label: {
                                Image(systemName: tabItems[i].image)
                                    .font(.title2)
                                    .foregroundColor(selectedTabIndex == i ? Color("accent") : Color("secondary"))
                            })
                            
                            if i != tabItems.count - 1 {
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .frame(height: 100)
                    .background(Color("foreground"))
                }
                .ignoresSafeArea(.all, edges: .bottom)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
