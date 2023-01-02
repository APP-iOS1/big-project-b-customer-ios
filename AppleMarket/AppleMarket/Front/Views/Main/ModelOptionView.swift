//
//  DetailOptionView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/27.
//

import SwiftUI

struct ModelOptionView: View {
    @State var isChecking = [false, false]
    @Binding var model: String
    @Binding var selectedProduct: CatalogueProduct
    

    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("모델.")
                    .bold()
                Text("당신에게 딱 맞는 모델은?")
            }
            .padding(.bottom, 10)
            
            Button {
                isChecking = [true, false]
                model = selectedProduct.model?[0] ?? ""
            } label: {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(selectedProduct.model?[0] ?? "")
                        Text("15.5cm 디스플레이")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("₩\(selectedProduct.price)부터")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .foregroundColor(.black)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(isChecking[0] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
            }
            .disabled(isChecking[0])

            Button {
                isChecking = [false, true]
                model = selectedProduct.model?[1] ?? ""
            } label: {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(selectedProduct.model?[1] ?? "")
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
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(isChecking[1] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
            }
            .disabled(isChecking[1])

        }
        .padding()
    }
}

struct ModelOptionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
