//
//  MainMyProductView.swift
//  AppleMarket
//
//  Created by youngseo on 2022/12/27.
//

import SwiftUI


struct MainMyProductView: View {
    
    var myProductsArray: [String] = ["airtag.fill", "magsafe.batterypack.fill", "figure.run", "battery.100.bolt", "camera.fill", "cable.connector", "signature", "iphone"]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("기기별로 쇼핑하기")
                .font(.title)
                .fontWeight(.bold)
            
            // 내 기기
            
//            // 등록된 기기가 없을 때            if{
//
//            NavigationLink(
 
            // destination 임의로 지정
//                destination: MypageView()){
//                    VStack(alignment: .center){
//                        Image(systemName: "plus.square.dashed")
//                            .frame(width: 200, height: 200)
//                        Text("등록된 기기가 없습니다.")
//                    }
//                    .foregroundColor(.gray)
//                }
//
//            //            }
            
            // 등록된 기기가 있을 때           else{
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<5){_ in
                        // 내 기기 이미지 사용 예정
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 330, height: 300)
                    }
                }
            }
            //            }
        }
        .padding(.top, 50)
        
        
    }
}

struct MainMyProductView_Previews: PreviewProvider {
    static var previews: some View {
        MainMyProductView()
    }
}
