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
    @EnvironmentObject var userInstore: UserInfoStore
    var myProducts: CatalogueProduct
    @EnvironmentObject var catalogueProductStore: CatalogueProductStore
    @State private var accessoryCount: Int = 0
    // device로 분류
    // 악세서리는 리스트 내 이름으로 분류
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading){
                
                //                let _: String = myProducts.thumbnailImage.isEmpty ? "" : (myProducts.thumbnailImage )
                
                ForEach(userInstore.userInfo?.myDevices ?? [] ,id:\.self) { product in
                    HStack{
                        //                        // 기기 사진
                        AsyncImage(url: URL(string: product.deviceImage )) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color.clear)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        VStack(alignment: .leading){
                            // "사용자" 의 "기기명"
                            Text(userInstore.userInfo?.userName ?? "")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .padding(.bottom, 1)
                            // "기기 종류" + "사양"
                            Text(product.deviceName)
                        }
                        .frame(alignment: .leading)
                        .padding()
                    }
                    
                    // "기기 종류" 용 추천
                    VStack {
                        Text("\(product.deviceName) 액세서리 추천")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .padding(.top, 30)
                    }
                }
                
                    // 추천 제품 이미지 사용 예정
                    TabView() {
                        
                        ForEach(catalogueProductStore.catalogueProductStores, id:\.self){ product in
                            if product.model?.contains(myProducts.productName) == true {
                                //model = prodcut.Name 같은것만 디테일 뷰로 넘기기
                                NavigationLink {
                                    DetailView(selectedProduct: product)
                                } label: {
                                    VStack {
                                        AsyncImage(url: URL(string: product.thumbnailImage)) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 180)
                                            
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        
                                        Text(product.productName)
                                            .padding(.bottom, 1)
                                        
                                        Text("₩\(product.price)")
                                    }
                                    .foregroundColor(.black)
                                    .padding()
                                }

                                
                              
                            }
                        }
                    }
                    .frame(minWidth: 200, minHeight: 300)
                    .tabViewStyle(PageTabViewStyle())
                
              
                
                // "기기 종류" 용
                Text("액세서리 더보기")
                    .font(.system(size: 24))
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
            }
            .padding(.horizontal, 10)
            // \(myProducts.productName)용
            .navigationBarTitle("\(myProducts.productName)용")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            for catalogItem in catalogueProductStore.catalogueProductStores {
                if catalogItem.model?.contains(myProducts.productName) == true {
                    accessoryCount += 1
                }
            }
        }
        
    }
}

struct MyProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyProductDetailView(myProducts: CatalogueProduct(id: "", productName: "", device: [], category: "", description: "", price: 0, thumbnailImage: "", status: 0))
    }
}
