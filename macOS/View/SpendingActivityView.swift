//
//  SpendingActivityView.swift
//  DigitalWalletApp (macOS)
//
//  Created by Raphael Cerqueira on 18/12/20.
//

import SwiftUI

struct ChartItem: Identifiable, Equatable {
    let id = UUID().uuidString
    var value: CGFloat
    var onHover = false
}

struct SpendingActivityView: View {
    let xAxis = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    let yAxis = ["0", "20", "40"]
    @State var data = [
        ChartItem(value: 0.25),
        ChartItem(value: 0.75),
        ChartItem(value: 0.15),
        ChartItem(value: 0.5),
        ChartItem(value: 0.7),
        ChartItem(value: 1),
        ChartItem(value: 0.65),
        ChartItem(value: 0.3),
        ChartItem(value: 0.1),
        ChartItem(value: 0.7),
        ChartItem(value: 0.3),
        ChartItem(value: 0.5)
    ]
    
    let height: CGFloat = 130
    
    @Binding var selectedIndex: Int
    @Binding var boxVisible: Bool
    @Binding var selectedHeight: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Spending Activity")
                    .font(.title2)
                    .foregroundColor(.primary)
                    .fontWeight(.medium)
                
                Spacer()
                
                Button(action: {}, label: {
                    HStack {
                        Text("01 - 12 December 2020")
                        
                        Image(systemName: "chevron.down.circle")
                    }
                    .foregroundColor(Color.gray)
                })
                .buttonStyle(PlainButtonStyle())
            }
            
            ZStack(alignment: .bottom) {
                VStack {
                    ForEach(yAxis.reversed(), id: \.self) { row in
                        HStack {
                            Text(row)
                                .foregroundColor(.gray)
                            
                            Line()
                                .stroke(style: row == yAxis.first ? StrokeStyle(lineWidth: 1) : StrokeStyle(lineWidth: 1, dash: [5]))
                                .frame(height: 1)
                                .foregroundColor(Color.gray.opacity(0.2))
                                .padding(.leading)
                        }
                        .padding(.top, 40)
                    }
                    
                    HStack(spacing: 0) {
                        ForEach(xAxis, id: \.self) { column in
                            Text(column)
                                .frame(width: 50)
                                .foregroundColor(Color.gray.opacity(0.5))
                            
                            if column != xAxis.last {
                                Spacer(minLength: 8)
                            }
                        }
                    }
                    .padding(.leading, 32)
                }
                
                HStack(alignment: .bottom, spacing: 0) {
                    ForEach(0 ..< data.count) { i in
                        RoundedRectangle(cornerRadius: 5)
                            .fill(data[i].onHover ? Color.blue : Color(#colorLiteral(red: 0.8920935988, green: 0.9059177041, blue: 0.9318218827, alpha: 1)))
                            .frame(width: 50, height: data[i].value * height)
                            .onHover(perform: { hovering in
                                withAnimation {
                                    data[i].onHover = hovering
                                    selectedIndex = i
                                    boxVisible = hovering
                                    selectedHeight = data[i].value * height
                                }
                            })
                        
                        if data[i] != data.last {
                            Spacer(minLength: 8)
                        }
                    }
                }
                .padding(.leading, 32)
                .padding(.bottom, 30)
            }
        }
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct MessageBox: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Spending")
                    .font(.subheadline)
                    .foregroundColor(.white)
                
                Text("06 December 2020")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .padding(.top, 8)
                
                Text("Rp 450.000")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.top)
            }
            .padding(.horizontal)
            .frame(height: 100)
            .background(Color(#colorLiteral(red: 0.2139710188, green: 0.2163155675, blue: 0.3590227365, alpha: 1)))
            .cornerRadius(12)
            .padding(.bottom, 10)
            
            Image(systemName: "arrowtriangle.down.fill")
                .resizable()
                .frame(width: 30, height: 11)
                .foregroundColor(Color(#colorLiteral(red: 0.2139710188, green: 0.2163155675, blue: 0.3590227365, alpha: 1)))
        }
    }
}

struct SpendingActivityView_Previews: PreviewProvider {
    static var previews: some View {
        SpendingActivityView(selectedIndex: .constant(0), boxVisible: .constant(false), selectedHeight: .constant(0))
    }
}
