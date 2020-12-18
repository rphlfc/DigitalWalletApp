//
//  MenuProfileView.swift
//  DigitalWalletApp (macOS)
//
//  Created by Raphael Cerqueira on 17/12/20.
//

import SwiftUI

struct MenuProfileView: View {
    var body: some View {
        HStack(spacing: 0) {
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Samantha")
                    .font(.title2)
                    .foregroundColor(.primary)
                    .fontWeight(.medium)
                
                Text("sam@email.com")
                    .foregroundColor(.gray)
            }
            .padding(.leading)
            
            Button(action: {}, label: {
                Image(systemName: "gearshape.fill")
                    .foregroundColor(Color("accent"))
                    .frame(width: 30, height: 30)
                    .background(Color("secondary"))
                    .cornerRadius(12)
            })
            .buttonStyle(PlainButtonStyle())
            .padding(.leading)
        }
        .padding()
    }
}

struct MenuProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MenuProfileView()
    }
}
