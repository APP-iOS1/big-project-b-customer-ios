//
//  MyProductResultView.swift
//  AppleMarket
//
//  Created by youngseo on 2022/12/27.
//

import SwiftUI

var products_3: [Product] = [
    Product(id: 0, imagePath: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MPPX3?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1661458144539", productName: "MagSafe형 iPhone 가죽 카드지갑 - 엄버", prices: "85,000"),
    Product(id: 1, imagePath: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MPPJ3_AV3?wid=2000&hei=2000&fmt=jpeg&qlt=90&.v=1662046154511", productName: "MagSafe형 iPhone 14 |\n 14 Pro 가죽 케이스 - 잉크", prices: "85,000"),
    Product(id: 2, imagePath: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MPU63_AV3?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1661471392622", productName: "MagSafe형 iPhone 14 |\n 14 Pro 투명 케이스", prices: "69,000"),
    Product(id: 3, imagePath: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MPTL3_AV3?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1661466613645", productName: "MagSafe형 iPhone 14 |\n Pro 실리콘 케이스", prices: "69,000")
]

struct MyProductResultView: View {
    
    let selectedProduct_3: Product
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var menuArray: [String] = ["AirTag 및 액세서리", "MagSafe", "건강 및 피트니스", "무선 충전기", "사진", "전원 & 케이블", " 창의성", "케이스 & 보호장비"]
    
    // 케이스 & 보호장비
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(.white)
            LazyVGrid(columns: columns) {
                
                ForEach(products_3, id: \.self) { product in
                    NavigationLink(destination: DetailView(), label:{
                        
                        VStack {
                            
                            Spacer()
                            
                            AsyncImage(url: URL(string: product.imagePath)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 150)
                                
                            } placeholder: {
                                ProgressView()
                            }
                            Spacer()
                                .frame(height: 50)
                            
                            Text(product.productName)
                                .fontWeight(.semibold)
                                .padding(.bottom, 1)
                                .font(.system(size: 14))
                            
                            Spacer()
                                .frame(height: 30)
                            
                            Text("₩\(product.prices)")
                                .font(.system(size: 14))
                            
                            Spacer()
                            
                            Divider()
                            
                        }
                        .foregroundColor(.black)
                        .frame(height: 400)
                        .padding()
                        
                        Divider()
                            .frame(height: 440)
                            .padding(.top, -40)
                        
                    })
                    
                }
                
            }
        }
    }
}


struct MyProductResultView_Previews: PreviewProvider {
    static var previews: some View {
        MyProductResultView(selectedProduct_3: Product(id: 0, imagePath: "", productName: "", prices: ""))
    }
}
