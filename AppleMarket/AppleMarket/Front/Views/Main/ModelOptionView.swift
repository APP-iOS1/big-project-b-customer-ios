//
//  DetailOptionView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/27.
//

import SwiftUI

struct ModelOptionView: View {
    @State var isChecking1: Bool = false
    @State var isChecking2: Bool = false
    @Binding var price: Int
    @Binding var model: String
    @Binding var memoryPrice: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("모델.")
                    .bold()
                Text("당신에게 딱 맞는 모델은?")
            }
            .padding(.bottom, 10)
            
            Button {
                isChecking1 = true
                isChecking2 = false
                price = 1550000
                memoryPrice = 1550000
                model = "iPhone 14 Pro"
            } label: {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("iPhone 14 Pro")
                        Text("15.5cm 디스플레이")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("₩1,550,000부터")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .foregroundColor(.black)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(isChecking1 ? Color("MainColor") : Color.gray, lineWidth: 1.5))
            }

            Button {
                isChecking1 = false
                isChecking2 = true
                price = 1750000
                memoryPrice = 1750000
                model = "iPhone 14 Pro Max"
            } label: {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("iPhone 14 Pro Max")
                        Text("17.0cm 디스플레이")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("₩1,750,000부터")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .foregroundColor(.black)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(isChecking2 ? Color("MainColor") : Color.gray, lineWidth: 1.5))
            }

        }
        .padding()
    }
}

//struct ModelOptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModelOptionView()
//    }
//}
