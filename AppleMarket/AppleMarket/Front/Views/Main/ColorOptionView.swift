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
                    isChecking = [true, false, false, false]
                    color = "딥 퍼플"
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
                        .stroke(isChecking[0] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[0])
                
                Button {
                    isChecking = [false, true, false, false]
                    color = "골드"
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
                        .stroke(isChecking[1] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[1])
            }
            
            HStack(alignment: .bottom, spacing: 15) {
                Button {
                    isChecking = [false, false, true, false]
                    color = "실버"
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
                        .stroke(isChecking[2] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[2])
                
                Button {
                    isChecking = [false, false, false, true]
                    color = "스페이스 블랙"
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
                        .stroke(isChecking[3] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
                }
                .disabled(isChecking[3])
            }
            
            
        }
    }
}

//struct ColorOptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorOptionView()
//    }
//}
