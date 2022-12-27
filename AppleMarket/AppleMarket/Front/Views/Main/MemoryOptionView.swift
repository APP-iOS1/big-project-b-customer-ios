//
//  MemoryOptionView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/27.
//

import SwiftUI

struct MemoryOptionView: View {
    @State var isChecking1: Bool = false
    @State var isChecking2: Bool = false
    @State var isChecking3: Bool = false
    @State var isChecking4: Bool = false
    @Binding var price: Int
    
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
                    isChecking1 = true
                    isChecking2 = false
                    isChecking3 = false
                    isChecking4 = false
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Text("128GB")
                        Text("₩\(price)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:170 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(isChecking1 ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                Button {
                    isChecking1 = false
                    isChecking2 = true
                    isChecking3 = false
                    isChecking4 = false
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Text("256GB")
                        Text("₩\(price+150000)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:170 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(isChecking2 ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
            }
            
            HStack(alignment: .bottom, spacing: 15) {
                Button {
                    isChecking1 = false
                    isChecking2 = false
                    isChecking3 = true
                    isChecking4 = false
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Text("512GB")
                        Text("₩\(price+450000)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:170 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(isChecking3 ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                Button {
                    isChecking1 = false
                    isChecking2 = false
                    isChecking3 = false
                    isChecking4 = true
                } label: {
                    
                    VStack(alignment: .center, spacing: 5) {
                        Text("1TB")
                        Text("₩\(price+750000)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    .foregroundColor(.black)
                    .frame(width:170 ,height: 70)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(isChecking4 ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
            }
            
            
        }
    }
}

//struct MemoryOptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoryOptionView(price: price)
//    }
//}
