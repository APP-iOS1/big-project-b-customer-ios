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
    @State var model: String = "iPhone 14 Pro"
    @State var memory: String = "128GB"
    @State var color: String = "실버"
    @State var memoryPrice: Int = 0
    
    var body: some View {
        ScrollView {
            VStack {
                Text("iPhone14 Pro 구입하기")
                    .font(.headline)
                TabView {
                    ForEach(0..<imageArr.count, id: \.self) { i in
                        AsyncImage(url: URL(string: imageArr[i])) { image in
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
                
                Text("₩1,550,000부터")
                
                Divider()
                    .padding(.vertical, 20)
                
                ModelOptionView(price: $price, model: $model, memoryPrice: $memoryPrice)
                    .padding(.bottom, 35)
                ColorOptionView(color: $color)
                    .padding(.bottom, 35)
                MemoryOptionView(price: $price, memory: $memory, memoryPrice: $memoryPrice)
                    .padding(.bottom, 35)
                AppleCareOptionView(price: $price)
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
                
            }
        } // ScrollView
    } //body
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
