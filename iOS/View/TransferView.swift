//
//  TransferView.swift
//  DigitalWalletApp (iOS)
//
//  Created by Raphael Cerqueira on 14/12/20.
//

import SwiftUI

struct TransferView: View {
    @State var value: String = "150.000"
    
    let keys = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        [".", "0", "#"]
    ]
    
    @State var maxWidth = UIScreen.main.bounds.width - 30
    @State var offset: CGFloat = 0
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            Color("foreground")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            presentation.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 23, weight: .medium))
                                .foregroundColor(.primary)
                        })
                        
                        Spacer()
                    }
                    
                    Text("Send Money")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                
                HStack(spacing: 0) {
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Samantha")
                            .font(.system(size: 19, weight: .semibold))
                            .foregroundColor(.primary)
                        
                        Text("Bank - 0987 3422 8756")
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "chevron.down")
                            .font(.system(size: 21, weight: .bold))
                            .foregroundColor(Color("accent"))
                    })
                }
                .padding(25)
                .background(Color("background"))
                .cornerRadius(20)
                .padding(.top, 30)
                
                Text(value)
                    .font(.system(size: 48, weight: .semibold))
                    .foregroundColor(Color("accent"))
                    .padding(.top, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 40) {
                        ForEach(keys, id: \.self) { row in
                            HStack(spacing: ((UIScreen.main.bounds.width - 30) / 3) - 40) {
                                ForEach(row, id: \.self) { item in
                                    if item == "#" {
                                        Button(action: {
                                            value = String(value.dropLast())
                                        }) {
                                            Image(systemName: "chevron.left.circle")
                                                .font(.system(size: 29))
                                                .foregroundColor(Color("accent").opacity(0.5))
                                        }
                                        .frame(width: 50, height: 50)
                                    } else {
                                        Button(action: {
                                            value += item
                                        }) {
                                            Text(item)
                                                    .font(.system(size: 32, weight: .semibold))
                                                    .foregroundColor(Color("accent").opacity(0.5))
                                        }
                                        .frame(width: 50, height: 50)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top)
                }
                .frame(width: UIScreen.main.bounds.width - 30)
                
                ZStack {
                    Capsule()
                        .fill(Color("accent"))
                        .frame(height: 81)
                    
                    Text("SWIPE TO SEND")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                    
                    HStack {
                        Capsule()
                            .fill(Color.white)
                            .frame(width: calculateWidth() + 65, height: 65)
                            .padding(.leading, 8)
                        
                        Spacer(minLength: 0)
                    }
                    
                    HStack {
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color("accent"))
                            .frame(width: 65, height: 65)
                            .clipShape(Circle())
                            .offset(x: offset)
                        .gesture(
                            DragGesture()
                                .onChanged({ (value) in
                                    onChanged(value: value)
                                })
                                .onEnded({ (value) in
                                   onEnd(value: value)
                                })
                        )
                        
                        Spacer()
                    }
                    .padding(.leading, 8)
                }
                .frame(width: maxWidth, height: 65)
                .padding(.bottom)
            }
            .padding(.horizontal)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    func calculateWidth() -> CGFloat {
        let percent = offset / maxWidth
        return percent * maxWidth
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.width > 0 && offset <= maxWidth - 81 {
            offset = value.translation.width
        }
    }
    
    func onEnd(value: DragGesture.Value) {
        withAnimation(Animation.easeOut(duration: 0.3)) {
            if offset > 180 {
                offset = maxWidth - 81
            } else {
                offset = 0
            }
        }
    }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView()
    }
}
