//
//  DetailOptionView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/27.
//

import SwiftUI

struct ModelOptionView: View {

    @ObservedObject var detailViewModel: DetailViewModel
    
    @State var isChecking: [Bool] = []
    @Binding var selectedProduct: CatalogueProduct
    var productDic: [String : [Product]]

    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("모델.")
                    .bold()
                Text("당신에게 딱 맞는 모델은?")
            }
            .padding(.bottom, 10)
            
            if !isChecking.isEmpty {
                ForEach(0..<selectedProduct.model!.count, id: \.self) { index in
                    Button {
                        isCheckingAllFalse()
                        isChecking[index] = true
                        detailViewModel.model = selectedProduct.model?[index] ?? ""
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(selectedProduct.model?[index] ?? "")
                            }
                            Spacer()
                            if productDic.isEmpty {
                              Text("₩0000부터")
                                .font(.caption)
                                .foregroundColor(.gray)
                            } else {
                                if let products = productDic[model] {
                                let price = products.sorted{ $0.price < $1.price }.first
                            
                                Text("₩\(price?.price ?? 00)부터")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                              }
                            }
                               
                        }
                        .foregroundColor(.black)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(isChecking[index] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                    }
                    .disabled(isChecking[index])
                }
            }
        }
        .padding()
        .onAppear{
            isChecking = [Bool](repeating: false, count: selectedProduct.model!.count)
            isChecking[0].toggle()
            
            detailViewModel.model = selectedProduct.model?[0] ?? ""
            
            print(isChecking)
            print("dic text")
            print(productStore.productDic)
        }
    }
    
    func isCheckingAllFalse() {
        for i in 0..<selectedProduct.model!.count {
            isChecking.insert(false, at: i)
        }
    }
}

struct ModelOptionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(ProductStore())
    }
}
