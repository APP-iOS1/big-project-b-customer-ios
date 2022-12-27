//
//  MainPromotionView.swift
//  AppleMarket
//
//  Created by youngseo on 2022/12/27.
//

import SwiftUI

struct MainPromotionView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("프로모션")
                .font(.title)
                .fontWeight(.bold)
            
            // 프로모션
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<5){_ in
                        
                        // 프로모션 이미지 사용 예정
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 330, height: 130)
                    }
                }
            }
        }
    }
}

struct MainPromotionView_Previews: PreviewProvider {
    static var previews: some View {
        MainPromotionView()
    }
}
