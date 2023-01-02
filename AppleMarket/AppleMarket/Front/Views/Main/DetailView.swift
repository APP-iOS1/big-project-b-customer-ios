//
//  DetailView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct DetailView: View {
    var imageArr: [String] = [
        "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-silver?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1663703840488",
        "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-silver_AV1?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1661969351381",
        "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-silver_AV2?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660754259155"]
    @State var price: Int = 0
    @State var memoryPrice: Int = 0
    
    @State var model: String = "iPhone 14 Pro"
    @State var memory: String = "128GB"
    @State var color: String = "실버"
    
    @State private var selectedProduct: CatalogueProduct = CatalogueProduct(id: "1A20CDEF-F296-444B-903C-4CD5C3A4A471", productName: "iPhone 14 Pro", device: ["iPhone 14 Pro"], category: "iPhone", description: "IPhone 14 Pro 입니다.", price: 1550000, thumbnailImage: "", status: 1, descriptionImages: [
        "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-silver?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1663703840488",
        "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-silver_AV1?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1661969351381",
        "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-silver_AV2?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660754259155"])
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("\(selectedProduct.productName) 구입하기")
                    .font(.headline)
                TabView {
                    ForEach(0..<(selectedProduct.descriptionImages?.count ?? 0), id: \.self) { i in
                        AsyncImage(url: URL(string: selectedProduct.descriptionImages?[i] ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                            
                        } placeholder: {
                            // 로딩되기 전까지 대체할 이미지 혹은 스타일
                            ProgressView()
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .frame(height: 250)
                
                Text("₩\(selectedProduct.price)부터")
                
                Divider()
                    .padding(.vertical, 20)
                
                ModelOptionView(model: $model, selectedProduct: $selectedProduct)
                    .padding(.bottom, 35)
                ColorOptionView(color: $color, selectedProduct: $selectedProduct)
                    .padding(.bottom, 35)
                MemoryOptionView( memory: $memory, selectedProduct: $selectedProduct)
                    .padding(.bottom, 35)
                
                HStack {
                    AsyncImage(url: URL(string: "https://as-images.apple.com/is/iphone-14-pro-silver-select_AV2?wid=724&hei=488&fmt=p-jpg&qlt=95&.v=1661288383328")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                        
                    } placeholder: {
                        // 로딩되기 전까지 대체할 이미지 혹은 스타일
                        ProgressView()
                    }
                    .frame(width: 150, height: 200)
                    .padding(.trailing, 20)

                    
                    VStack(alignment: .leading) {
                        Text("\(model)")
                        Text("\(memory) \(color)")
                            .padding(.bottom, 20)
                        Text("₩\(price)")
                            .font(.caption)
                    }
                    Spacer()
                } // 선택 제품
                .frame(width: 355)
                
                DetailButtonView()
                    .padding(.bottom, 20)
                
            }
        } // ScrollView
    } //body
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
