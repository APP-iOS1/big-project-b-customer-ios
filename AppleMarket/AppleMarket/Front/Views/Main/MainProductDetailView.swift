//
//  MainProductDetailView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct MainProduct: Identifiable, Hashable{
    var id: Int
    let imagePath: String
    let productName: String
    var description: String? = nil
    let prices: String
    
    
}

struct MainProductDetailView: View {
    
    
    
    let products: [MainProduct] = [
        MainProduct(id: 0, imagePath: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-pro-13-select-wifi-spacegray-202210?wid=940&hei=1112&fmt=p-jpg&qlt=95&.v=1664411207212", productName: "iPad Pro", prices: "1,249,000"),
        MainProduct(id: 1, imagePath: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-ipad-air-wifi-gold-2021?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1644268571040", productName: "iPad Air", prices: "1,249,000"),
        MainProduct(id: 2, imagePath: "https://m.media-amazon.com/images/I/31reJbshTLL._AC_SY1000_.jpg", productName: "iPad(10세대)", prices: "1,249,000"),
        MainProduct(id: 3, imagePath: "https://m.media-amazon.com/images/I/31jtlnmtOhL._AC_SY1000_.jpg", productName: "iPad(9세대)", prices: "1,249,000"),
        MainProduct(id: 4, imagePath: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-mini-select-wifi-pink-202109_FMT_WHH?wid=940&hei=1112&fmt=png-alpha&.v=1629840647000", productName: "iPad mini", prices: "1,249,000"),
    ]
    
    let promotionProducts: [MainProduct] = [
        MainProduct(id: 0, imagePath: "https://www.apple.com/newsroom/images/product/ipad/standard/apple_ipad-pro-spring21_hero_04202021_big.jpg.large.jpg", productName: "iPad Pro", description: "최첨단 기술이 구현하는 궁극의 iPad 경험. 역대 가장 프로다운 iPad를 만나다. " ,prices: "1,249,000"),
        MainProduct(id: 1, imagePath: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-finish-unselect-gallery-2-202207_FMT_WHH?wid=1280&hei=720&fmt=p-jpg&qlt=95&.v=1654902551786", productName: "iPad(10세대)", prices: "1,249,000"),
    ]
    
    
    
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            let itemWidth = width * 0.8
            let itemHeight = height * 0.65
            
            ScrollView {
                ScrollView(.horizontal) {
                    Spacer()
                        .frame(height: itemHeight * 0.05)
                    HStack(spacing: 20) {
                        ForEach(promotionProducts) { product in
                            AsyncImage(url: URL(string: product.imagePath)) { Image in
                                ZStack{
                                    Image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: itemWidth, height: itemHeight)
                                        .clipped()
                                        .cornerRadius(30)
                                        .shadow(radius: 10)
                                        .overlay{
                                            RoundedRectangle(cornerRadius: 30)
                                                .fill(LinearGradient(colors: [.black.opacity(0.15), .clear], startPoint: UnitPoint(x:0.5, y: 0), endPoint: UnitPoint(x:0.5, y: 0.5)))
                                        }
                                        .overlay {
                                            HStack {
                                                VStack(alignment: .leading) {
                                                    Text("New")
                                                        .foregroundColor(.orange)
                                                    Text(product.productName)
                                                        .foregroundColor(.white)
                                                        .font(.title)
                                                        .fontWeight(.semibold)
                                                    Text(product.description ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.caption)
                                                    Spacer()
                                                    
                                                }
                                                Spacer()
                                            }
                                            .frame(width: itemWidth * 0.9, height: itemHeight * 0.9)
                                            
                                        }
                                    
                                    
                                    //
                                }
                                
                                
                            } placeholder: {
                                Rectangle()
                                    .stroke(lineWidth: 0.1)
                                    .frame(width: itemWidth, height: itemHeight)
                                    .cornerRadius(30)
                                    .overlay {
                                        ProgressView()
                                    }
                                
                                    
                            }
                        }
                    }
                    .snapScrolling(itemCount: promotionProducts.count , itemWidth: itemWidth, spacing: 20)
                    Spacer()
                        .frame(height: itemHeight * 0.05)
                }
                .scrollDisabled(true)
                
                Spacer()
                    .frame(height: itemHeight * 0.05)
                
                Divider()
                
                Spacer()
                    .frame(height: itemHeight * 0.1)
   
                LazyVStack {
                    ForEach(products) { product in
                        VStack {
                            AsyncImage(url: URL(string: product.imagePath)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100)
                                    .clipped()
                                    
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 100, height: 135)
                            }
                            Spacer()
                                .frame(height: 25)
                            Text(product.productName)
                                .font(.headline)
                            Spacer()
                            Text("₩\(product.prices)부터")
                                .foregroundColor(Color("MainColor"))
                        }
                        .padding(.vertical, 32)
                        
                       
                    }
                    
                }
            }
            
        }
    }
}

struct MainProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainProductDetailView()
    }
}
