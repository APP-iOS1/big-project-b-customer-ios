//
//  MemoryOptionView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/27.
//

import SwiftUI

struct MemoryOptionView: View {
    @State private var isChecking = [false, false, false, false]
    @Binding var price: Int
    @Binding var memory: String
    @Binding var memoryPrice: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("저장용량.")
                    .bold()
                Text("당신에게 알맞는 저장 용량은?")
            }
            .padding(.bottom, 10)
            
            
            HStack(alignment: .bottom, spacing: 15) {
                Button {
                    isChecking = [true, false, false, false]
                    memory = "128GB"
                    price = memoryPrice
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Text("128GB")
                        Text("₩\(memoryPrice)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:170 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(isChecking[0] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[0])
                
                Button {
                    isChecking = [false, true, false, false]
                    memory = "256GB"
                    price = memoryPrice
                    price += 150000
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Text("256GB")
                        Text("₩\(memoryPrice+150000)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:170 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(isChecking[1] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[1]) //isChecking2가 true일때 비활성화
            }
            
            HStack(alignment: .bottom, spacing: 15) {
                Button {
                    isChecking = [false, false, true, false]
                    memory = "512GB"
                    price = memoryPrice
                    price += 450000
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Text("512GB")
                        Text("₩\(memoryPrice+450000)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:170 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(isChecking[2] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[2])
                
                Button {
                    isChecking = [false, false, false, true]
                    memory = "1TB"
                    price = memoryPrice
                    price += 750000
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Text("1TB")
                        Text("₩\(memoryPrice+750000)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:170 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 15)
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
    }
}
