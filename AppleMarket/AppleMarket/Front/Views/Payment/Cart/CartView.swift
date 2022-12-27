//
//  CartView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct CartView: View {
    var productNames = ["AirPods(3세대) Lightning 충전 케이스 모델", "10.2형 iPad 256GB - 스페이스 그레이", "Magic Trackpad - 화이트 Multi-Touch"]
    var prices = ["₩259,000", "₩939,000", "₩149,000"]
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6)
            VStack {
                Text("장바구니")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                HStack {
                    Button(action: {}) {
                        Text("전체선택")
                    }
                    Spacer()
                    Button(action: {}) {
                        Text("지우기")
                    }
                }
                .foregroundColor(Color("MainColor"))
                .padding()
                
                ScrollView {
                    ForEach(0..<productNames.count, id: \.self) { index in
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20)
                            }
                            
                            AsyncImage(url: URL(string: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MME73_AV2?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1632861338000"), scale: 13)
                            
                            VStack(alignment: .leading, spacing: 18) {
                                Text(productNames[index])
                                    .fontWeight(.bold)
                                
                                HStack(spacing: 12) {
                                    Button(action: {}) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 1)
                                                .fill(Color(UIColor.systemGray5))
                                                .frame(width: 25, height: 25)
                                            Image(systemName: "minus")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 8)
                                                .foregroundColor(.black)
                                        }
                                    }
                                    
                                    Text("1")
                                        .font(.system(size: 17))
                                    
                                    
                                    Button(action: {}) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 1)
                                                .fill(Color(UIColor.systemGray5))
                                                .frame(width: 25, height: 25)
                                            Image(systemName: "plus")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 8)
                                                .foregroundColor(.black)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    Text(prices[index])
                                        .fontWeight(.semibold)
                                }
                                
                            }
                        }
                        .padding(30)
                        .background(.white)
                        .padding(.vertical, 2)
                    }
                }
                
                HStack {
                    Text("결제금액")
                    Spacer()
                    Text("₩1,347,000")
                }
                .fontWeight(.bold)
                .padding()
                .padding(.top, 10)
                
                Button(action: {}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("MainColor"))
                            .frame(maxWidth: .infinity, maxHeight: 55, alignment: .center)
                        Text("결제")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .padding(.bottom, 30)
            }
            .padding(.top, 55)
        }
        .ignoresSafeArea(.all)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
