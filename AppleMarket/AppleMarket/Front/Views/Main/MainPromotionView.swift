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
                .font(.system(size: 24))
                .fontWeight(.bold)
            
            // 프로모션
            TabView {
                ForEach(0..<5, id: \.self) { _ in
                    Rectangle()
                            .scaledToFit()
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 130)
        }
    }
}

struct MainPromotionView_Previews: PreviewProvider {
    static var previews: some View {
        MainPromotionView()
    }
}
