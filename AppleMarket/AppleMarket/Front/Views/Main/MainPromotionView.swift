//
//  MainPromotionView.swift
//  AppleMarket
//
//  Created by youngseo on 2022/12/27.
//

import SwiftUI

struct MainPromotionView: View {
    struct Promotion: Hashable {
        let imagePath: String
        let title: String
    }
    
    let promotions: [Promotion] = [
        Promotion(imagePath: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/og-holiday-2022?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1664549930560", title: "연말연시 최고의 선물"),
        Promotion(imagePath: "https://www.apple.com/newsroom/images/product/iphone/standard/holidays/Apple_Retail-Holiday_The-Grove_11092021_big.jpg.large.jpg", title: "")
    ]
    
    
    
    var body: some View {
        GeometryReader { geo in
            let width: CGFloat = geo.size.width
            let height: CGFloat = geo.size.height
            
            VStack(alignment: .leading){
                Text("프로모션")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                
            Spacer()
                    .frame(height: height * 0.05)
                
                // 프로모션
                TabView {
                    ForEach(promotions, id: \.self) { promotion in
                        AsyncImage(url: URL(string: promotion.imagePath)) { Image in
                            NavigationLink {
                                MainProductDetailView(category: "")
                                    .navigationTitle(promotion.title)
                                    .navigationBarTitleDisplayMode(.inline)
                            } label: {
                                Image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: width, height: height)
                                    .clipped()
                                    .cornerRadius(10)
                                    .overlay {
                                        VStack {
                                            Spacer()
                                            HStack(alignment: .bottom) {
                                                Spacer()
                                                Text(promotion.title)
                                                    .font(.caption.bold())
                                                    .foregroundColor(.white)
                                                    .shadow(radius: 1)
                                            }
                                        }
                                        .frame(width: width - 20, height: height - 20)
                                        
                                    }
                                

                            }
                        } placeholder: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 0.5)
                                .frame(width: width, height: height, alignment: .bottom)
                                .overlay {
                                    ProgressView()
                                }
                                
                        }
                        .padding()
                        .tabItem {
                            Text(promotion.title)
                        }
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 130)
            }
        }
    }
}

struct MainPromotionView_Previews: PreviewProvider {
    static var previews: some View {
        MainPromotionView()
    }
}
