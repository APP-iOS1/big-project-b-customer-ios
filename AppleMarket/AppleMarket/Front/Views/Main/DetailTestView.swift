//
//  DetailOptionView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/27.
//

import SwiftUI

struct DetailTestView: View {
    @State var isChecking = [false, false]
    @Binding var model: String
    @Binding var selectedProduct: CatalogueProduct
    @State var productArr: [[Product]]
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("모델.")
                    .bold()
                Text("당신에게 딱 맞는 모델은?")
            }
            .padding(.bottom, 10)
            
            ForEach(0..<selectedProduct.model!.count) { idx in
                Button {
                    isChecking = [false, false]
                    isChecking[idx] = true
                    model = selectedProduct.model?[0] ?? ""
                } label: {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(selectedProduct.model?[0] ?? "")
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
            }
            
        }
        .padding()
    }
}

struct DetailTestView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(ProductStore())
    }
}
