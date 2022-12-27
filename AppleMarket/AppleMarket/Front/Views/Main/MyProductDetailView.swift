//
//  MyProductDetailView.swift
//  AppleMarket
//
//  Created by youngseo on 2022/12/27.
//

import SwiftUI

struct MyProductDetailView: View {
    // store에 무슨 값 있는지 몰라서 일단 공홈대로 적음
    var menuArray: [String] = ["AirTag 및 액세서리", "MagSafe", "건강 및 피트니스", "무선 충전기", "사진", "전원 & 케이블", " 창의성", "케이스 & 보호장비"]
    
    var menuImageArray: [String] = ["airtag.fill", "magsafe.batterypack.fill", "figure.run", "", "camera.fill", "cable.connector", "", ""]
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                HStack{
                    // 기기 사진
                    Rectangle()
                        .frame(width: 100, height: 100, alignment: .leading)
                    
                    VStack(alignment: .leading){
                        // "사용자" 의 "기기명"
                        Text("김영서의 iPhone")
                        // "기기 종류" + "사양"
                        Text("iPhon 12 Pro 256GB 실버")
                    }
                    .frame(alignment: .leading)
                    .padding()
                }
                
                // "기기 종류" 용 추천
                Text("iPhone 12 Pro용 추천")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
                ScrollView(.horizontal){
                    HStack(alignment: .center){
                        ForEach(0..<8){_ in
                            // 추천 제품 이미지 사용 예정
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 330, height: 400)
                                    .foregroundColor(.white)
                                    .shadow(radius: 10)
                                    .frame(width: 350, height: 450)
                            }
                        }
                    }
                }
                
                Text("iPhone 12 Pro용")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
                List{
                    ForEach(Array(0..<8), id: \.self) { index in
                        NavigationLink {
                            MyProductResultView()
                        } label: {
                            Image(systemName: "\(menuImageArray[index])")
                            Text("\(menuArray[index])")
                        }
                    }
                }
                .font(.system(size: 17))
                .foregroundColor(.black)
                .listStyle(.inset)
                .frame(height: 400)
            }
            .padding()
        }
    }
}

struct MyProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyProductDetailView()
    }
}
