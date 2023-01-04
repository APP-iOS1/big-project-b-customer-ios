//
//  ColorOptionView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/27.
//

import SwiftUI

struct ColorOptionView: View {
    @State private var isChecking: [Bool] = []
    @Binding var color: String
    @Binding var selectedProduct: CatalogueProduct
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("색상.")
                    .bold()
                Text("맘에 드는 색상을 선택하세요.")
            }
            .padding(.bottom, 10)
            
            if !isChecking.isEmpty {
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach(0..<selectedProduct.color!.count, id: \.self) { index in
                        Button {
                            isCheckingAllFalse()
                            isChecking[index] = true
                            //color = selectedProduct.color?[index] ?? ""
                        } label: {
                            
                            VStack(alignment: .center, spacing: 5) {
                                Circle()
                                    .frame(width:25 ,height: 25)
                                    .foregroundColor(Color("\(selectedProduct.color?[index] ?? "")"))
                                    .shadow(radius: 1)
                                Text(selectedProduct.color?[index] ?? "")
                                
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
            isChecking = [Bool](repeating: false, count: selectedProduct.color!.count)
            print(isChecking)
        }
    }
    
    
    func isCheckingAllFalse() {
        for i in 0..<selectedProduct.color!.count {
            isChecking.insert(false, at: i)
        }
    }
}

struct ColorOptionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(ProductStore())
    }
}
