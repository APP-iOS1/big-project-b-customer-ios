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
                        .tag(i)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .frame(height: 250)
                
                Text("₩1,550,000부터")
                
                Divider()
                    .padding(.vertical, 20)
                
                ModelOptionView(price: $price)
                    .padding(.bottom, 35)
                ColorOptionView()
                    .padding(.bottom, 35)
                MemoryOptionView(price: $price)
                    .padding(.bottom, 35)
                AppleCareOptionView()
                    .padding(.bottom, 35)
                
            }
        } // ScrollView
    } //body
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
