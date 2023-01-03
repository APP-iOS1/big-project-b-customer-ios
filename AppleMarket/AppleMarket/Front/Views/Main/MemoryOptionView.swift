//
//  MemoryOptionView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/27.
//

import SwiftUI

struct MemoryOptionView: View {
    @State private var isChecking = [false, false, false, false]
    @Binding var memory: String
    @Binding var selectedProduct: CatalogueProduct

    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("저장용량.")
                    .bold()
                Text("당신에게 알맞는 저장 용량은?")
            }
            .padding(.bottom, 10)
            
            
            HStack(alignment: .bottom, spacing: 10) {
                Button {
                    isChecking = [true, false, false, false]

                    memory = selectedProduct.storage?[0] ?? ""
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Text(selectedProduct.storage?[0] ?? "")
                        Text("₩")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:172.5 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(isChecking[0] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[0])
                
                Button {
                    isChecking = [false, true, false, false]

                    memory = selectedProduct.storage?[1] ?? ""
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Text(selectedProduct.storage?[1] ?? "")
                        Text("₩")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:172.5 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(isChecking[1] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[1]) //isChecking2가 true일때 비활성화
            }
            
            HStack(alignment: .bottom, spacing: 10) {
                Button {
                    isChecking = [false, false, true, false]
                    memory = selectedProduct.storage?[2] ?? ""
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Text(selectedProduct.storage?[2] ?? "")
                        Text("₩")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:172.5 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(isChecking[2] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[2])
                
                Button {
                    isChecking = [false, false, false, true]
                    memory = selectedProduct.storage?[3] ?? ""

                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {

                        Text(selectedProduct.storage?[3] ?? "")
                        Text("₩")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:172.5 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(isChecking[3] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[3])
            }
            
            
        }
    }
}

struct MemoryOptionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(ProductStore())
    }
}
