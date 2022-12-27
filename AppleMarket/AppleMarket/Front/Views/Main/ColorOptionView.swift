//
//  ColorOptionView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/27.
//

import SwiftUI

struct ColorOptionView: View {
    @State var isChecking1: Bool = false
    @State var isChecking2: Bool = false
    @State var isChecking3: Bool = false
    @State var isChecking4: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("색상.")
                    .bold()
                Text("맘에 드는 색상을 선택하세요.")
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
                        Circle()
                            .frame(width:25 ,height: 25)
                            .foregroundColor(Color(red: 97/255, green: 88/255, blue: 105/255))
                            .shadow(radius: 1)
                        Text("딥 퍼플")
                        
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
                        Circle()
                            .frame(width:25 ,height: 25)
                            .foregroundColor(Color(red: 243/255, green: 234/255, blue: 205/255))
                            .shadow(radius: 1)
                        Text("골드")
                        
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
                        Circle()
                            .frame(width:25 ,height: 25)
                            .foregroundColor(Color(red: 241/255, green: 243/255, blue: 242/255))
                            .shadow(radius: 1)
                        Text("실버")
                        
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
                        Circle()
                            .frame(width:25 ,height: 25)
                            .foregroundColor(Color(red: 89/255, green: 88/255, blue: 86/255))
                            .shadow(radius: 1)
                        Text("스페이스 블랙")
                        
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

struct ColorOptionView_Previews: PreviewProvider {
    static var previews: some View {
        ColorOptionView()
    }
}
