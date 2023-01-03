//
//  ColorOptionView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/27.
//

import SwiftUI

struct ColorOptionView: View {
    @State private var isChecking = [false, false, false, false]
    @Binding var color: String
    @Binding var selectedProduct: CatalogueProduct
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("색상.")
                    .bold()
                Text("맘에 드는 색상을 선택하세요.")
            }
            .padding(.bottom, 10)
            
            
            HStack(alignment: .bottom, spacing: 10) {
                Button {
                    isChecking = [true, false, false, false]
                    color = selectedProduct.color?[0] ?? ""
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Circle()
                            .frame(width:25 ,height: 25)
                            .foregroundColor(Color("\(selectedProduct.color?[0] ?? "")"))
                            .shadow(radius: 1)
                        Text(selectedProduct.color?[0] ?? "")
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:172.5 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(isChecking[0] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[0])
                
                Button {
                    isChecking = [false, true, false, false]
                    color = selectedProduct.color?[1] ?? ""
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Circle()
                            .frame(width:25 ,height: 25)
                            .foregroundColor(Color("\(selectedProduct.color?[1] ?? "")"))
                            .shadow(radius: 1)
                        Text(selectedProduct.color?[1] ?? "")
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:172.5 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(isChecking[1] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[1])
            }
            
            HStack(alignment: .bottom, spacing: 10) {
                Button {
                    isChecking = [false, false, true, false]
                    color = selectedProduct.color?[2] ?? ""
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Circle()
                            .frame(width:25 ,height: 25)
                            .foregroundColor(Color("\(selectedProduct.color?[2] ?? "")"))
                            .shadow(radius: 1)
                        Text(selectedProduct.color?[2] ?? "")
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:172.5 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(isChecking[2] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[2])
                
                Button {
                    isChecking = [false, false, false, true]
                    color = selectedProduct.color?[3] ?? ""
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Circle()
                            .frame(width:25 ,height: 25)
                            .foregroundColor(Color("\(selectedProduct.color?[3] ?? "")"))
                            .shadow(radius: 1)
                        Text(selectedProduct.color?[3] ?? "")
                        
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

struct ColorOptionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
