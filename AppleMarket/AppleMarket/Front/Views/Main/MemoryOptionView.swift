//
//  MemoryOptionView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/27.
//

import SwiftUI

struct MemoryOptionView: View {
    @State private var isChecking: [Bool] = []
    @Binding var memory: String
    @Binding var selectedProduct: CatalogueProduct
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("저장용량.")
                    .bold()
                Text("당신에게 알맞는 저장 용량은?")
            }
            .padding(.bottom, 10)
            
            if !isChecking.isEmpty {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(0..<selectedProduct.storage!.count, id: \.self) { index in
                        Button {
                            isCheckingAllFalse()
                            isChecking[index] = true
                            memory = selectedProduct.storage?[index] ?? ""
                        } label: {
                            
                            VStack(alignment: .center, spacing: 5) {
                                Text(selectedProduct.storage?[index] ?? "")
                                Text("₩")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                            }
                            .foregroundColor(.black)
                            .frame(width:172.5 ,height: 70)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(isChecking[index] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                        }
                        .disabled(isChecking[index])
                    }
                }
            }
        }
        .onAppear {
            isChecking = [Bool](repeating: false, count: selectedProduct.storage!.count)
            print(isChecking)
        }
    }
    
    func isCheckingAllFalse() {
        for i in 0..<selectedProduct.storage!.count {
            isChecking.insert(false, at: i)
        }
    }
}

struct MemoryOptionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(ProductStore())
    }
}
