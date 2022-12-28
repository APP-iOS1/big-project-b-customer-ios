//
//  MyProductDetailView.swift
//  AppleMarket
//
//  Created by youngseo on 2022/12/27.
//

import SwiftUI

var products_2: [MainProduct] = [
    MainProduct(id: 0, imagePath: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/airtag-4pack-select-202104_FV1?wid=890&hei=740&fmt=jpeg&qlt=90&.v=1617761668000", productName: "AirTag 4개 팩", prices: "149,000"),
    MainProduct(id: 1, imagePath: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MM073?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1624640865000", productName: "AirTag 가죽 키링 - 포레스트 그린", prices: "58,000"),
    MainProduct(id: 2, imagePath: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MX4A2?wid=2000&hei=2000&fmt=jpeg&qlt=90&.v=1618028917000", productName: "AirTag 가죽 루프 - 새들 브라운", prices: "62,000"),
    MainProduct(id: 3, imagePath: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MK0W3?wid=2000&hei=2000&fmt=jpeg&qlt=90&.v=1618028904000", productName: "AirTag 루프 - 선플라워", prices: "45,000")
]

struct MyProductDetailView: View {
    // store에 무슨 값 있는지 몰라서 일단 공홈대로 적음
    var menuArray: [String] = ["AirTag 및 액세서리", "MagSafe", "건강 및 피트니스", "무선 충전기", "사진", "전원 & 케이블", " 창의성", "케이스 & 보호장비"]
    
    var menuImageArray: [String] = ["airtag.fill", "magsafe.batterypack.fill", "figure.run", "battery.100.bolt", "camera.fill", "cable.connector", "signature", "iphone"]
    
//    let selectedProduct_2: Product
    
    var myProducts: UserProduct
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                HStack{
                    // 기기 사진
                    AsyncImage(url: URL(string: myProducts.images[0] ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading){
                        // "사용자" 의 "기기명"
                        Text("김영서의 \(myProducts.category)")
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .padding(.bottom, 1)
                        // "기기 종류" + "사양"
                        Text("\(myProducts.productName)")
                            .font(.system(size: 14))
                    }
                    .frame(alignment: .leading)
                    .padding()
                }
                
                // "기기 종류" 용 추천
                Text("\(myProducts.productName)용 추천")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
                ScrollView(.horizontal){
                    HStack(alignment: .center){
                        ForEach(products_2){ product in
                            NavigationLink{
                                DetailView()
                            } label:{
                            // 추천 제품 이미지 사용 예정
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 330, height: 400)
                                    .foregroundColor(.white)
                                    .shadow(radius: 10)
                                    .frame(width: 350, height: 450)
                                
                                VStack {
                                    AsyncImage(url: URL(string: product.imagePath)) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 180)
                                        
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Spacer()
                                        .frame(height: 50)
                                    
                                    Text(product.productName)
                                        .padding(.bottom, 1)
                                    
                                    Text("₩\(product.prices)")
                                }
                                
                            }
                            .foregroundColor(.black)
                        }
                        }
                    }
                }
                
                // "기기 종류" 용
                Text("\(myProducts.productName)용")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
                List{
                    ForEach(Array(0..<8), id: \.self) { index in
                        NavigationLink {
                            MyProductResultView(selectedProduct_3: MainProduct(id: 0, imagePath: "", productName: "", prices: ""))
                                .navigationTitle(menuArray[index])
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
                // \(myProducts.productName)용
                .navigationBarTitle("\(myProducts.productName)용")
            }
            .padding()
            // \(myProducts.productName)용
            .navigationBarTitle("\(myProducts.productName)용")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

struct MyProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyProductDetailView(myProducts: UserProduct(id: "", productName: "", device: "", category: "", description: "", price: 0, images: [], count: 0, storage: [0], color: [], status: 0, createdAt: Date(), series: []))
    }
}
