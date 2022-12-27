//
//  MainProducDetailView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct Product: Identifiable{
    var id: Int
    let imagePath: String
    let productName: String
    let prices: String
}

var products: [Product] = [
    Product(id: 0, imagePath: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-pro-13-select-wifi-spacegray-202210?wid=940&hei=1112&fmt=p-jpg&qlt=95&.v=1664411207212", productName: "iPad Pro", prices: "1,249,000"),
    Product(id: 1, imagePath: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-ipad-air-wifi-gold-2021?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1644268571040", productName: "iPad Air", prices: "1,249,000"),
    Product(id: 2, imagePath: "https://m.media-amazon.com/images/I/31reJbshTLL._AC_SY1000_.jpg", productName: "iPad(10세대)", prices: "1,249,000"),
    Product(id: 3, imagePath: "https://m.media-amazon.com/images/I/31jtlnmtOhL._AC_SY1000_.jpg", productName: "iPad(9세대)", prices: "1,249,000"),
    Product(id: 4, imagePath: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-mini-select-wifi-pink-202109_FMT_WHH?wid=940&hei=1112&fmt=png-alpha&.v=1629840647000", productName: "iPad mini", prices: "1,249,000"),
]


enum SelectedProduct {
    case iPad
    case iPhone
    case Mac
    case MacBook
    case Accessory
}

struct MainProducDetailView: View {
    @State private var selectedProduct: SelectedProduct = .iPad
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(products) { product in
                    VStack {
                        AsyncImage(url: URL(string: product.imagePath)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height:135)
                                
                        } placeholder: {
                            ProgressView()
                        }
                        Spacer()
                            .frame(height: 40)
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

struct MainProducDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainProducDetailView()
    }
}
