//
//  MainProductView.swift
//  AppleMarket
//
//  Created by youngseo on 2022/12/27.
//

import SwiftUI

struct MainProductView: View {
    var body: some View {
        
        Text("제품별로 쇼핑하기")
            .font(.title)
            .fontWeight(.bold)
            .frame(alignment: .leading)
            .padding(.top, 50)
        
        VStack(alignment: .center){
            
            // 신제품
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 360, height: 220)
            
            HStack{
                // Mac
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 175, height: 220)
                
                // iPhone
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 175, height: 220)
            }
            
            HStack{
                //iPad
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 175, height: 220)
                
                // Apple Watch
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 175, height: 220)
            }
            
            HStack{
                // Apple TV 4K
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 175, height: 220)
                
                // AirPods
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 175, height: 220)
            }
            
            HStack{
                // AirTag
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 175, height: 220)
                
                // 액세서리
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 175, height: 220)
            }
        }
    }
}

struct MainProductView_Previews: PreviewProvider {
    static var previews: some View {
        MainProductView()
    }
}
