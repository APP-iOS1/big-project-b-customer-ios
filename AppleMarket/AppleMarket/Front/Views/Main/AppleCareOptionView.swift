//
//  AppleCare+OptionView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/27.
//

import SwiftUI

struct AppleCareOptionView: View {
    @State private var isChecking = [false, false]
    
    @Binding var price: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("AppleCare+ 보증.")
                    .bold()
                Text("구입한 iPhone을 보호하세요")
            }
            .padding(.bottom, 10)
            
            Button {
                isChecking = [true, false]
                price += 296000
            } label: {
                VStack(alignment: .leading, spacing: 5) {
                        Text("AppleCare+")
                        Text("₩296,000")
                    Divider()
                        .padding(.vertical, 5)
                    VStack(alignment: .leading) {
                        Text("· 이제 우발적인 손상에 대한 수리 서비스를 횟수 제한 없이 제공")
                        Text("· Apple 정품 부품으로 진행되는 Apple 인증 수리 서비스")
                        Text("· Apple 전문가의 우선 지원")
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
                .foregroundColor(.black)
                .padding()
                .frame(width: 355)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(isChecking[0] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
            }
            .disabled(isChecking[0])

            Button {
                isChecking = [false, true]
                price -= 296000
            } label: {
                HStack {
                    Text("AppleCare+ 보증 추가 안 함")
                        .padding(.leading)
                    Spacer()
                }
                .foregroundColor(.black)
                .frame(width: 355, height: 70)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(isChecking[1] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
            }
            .disabled(isChecking[1])
            
        }
        .padding()
    }
}

//struct AppleCare_OptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppleCareOptionView()
//    }
//}
