//
//  LatestTransactionsView.swift
//  DigitalWalletApp (macOS)
//
//  Created by Raphael Cerqueira on 18/12/20.
//

import SwiftUI

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
                .frame(width: 130, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.leading)
            
            Spacer()
                
            Text(item.date)
                .foregroundColor(Color.primary.opacity(0.4))
            
            Spacer()
            
            Text(item.description)
                .foregroundColor(Color.primary.opacity(0.4))
                .frame(width: 140, alignment: .leading)
            
            Spacer()
            
            Text(item.value)
                .foregroundColor(Color.primary)
                .fontWeight(.bold)
        }
        .padding()
    }
}

struct LatestTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        LatestTransactionsView()
    }
}
