//
//  CartView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct CartView: View {
    @State var productNames: [String] = ["AirPods(3세대) Lightning 충전 케이스 모델", "10.2형 iPad 256GB - 스페이스 그레이", "Magic Trackpad - 화이트 Multi-Touch"]
    var prices: [String] = ["₩259,000", "₩939,000", "₩149,000"]
    @State private var selectProducts: [Bool] = Array(repeating: true, count: 3) // 선택 상품 확인
    @State private var allSelect: Bool = true // 상품 전체선택 확인
    @State private var disabled: Bool = false // 결제 버튼 활성화
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6)
            VStack {
                // title
                Text("장바구니")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                HStack {
                    // 전체선택
                    Button(action: {
                        if allSelect {
                            selectProducts = Array(repeating: false, count: productNames.count)
                            disabled = true
                        } else {
                            selectProducts = Array(repeating: true, count: productNames.count)
                            disabled = false
                        }
                        allSelect = !allSelect
                    }) {
                        HStack {
                            Image(systemName: allSelect ? "checkmark.circle.fill" : "checkmark.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                            Text("전체선택")
                        }
                    }
                    
                    Spacer()
                    
                    // 지우기
                    Button(action: {
                        for index in stride(from: productNames.count-1, through: 0, by: -1) {
                            if selectProducts[index] {
                                productNames.remove(at: index)
                            }
                        }
                        selectProducts = Array(repeating: false, count: selectProducts.filter{!$0}.count)
                        
                        if productNames.isEmpty {
                            UIView.setAnimationsEnabled(false)
                        }
                    }) {
                        Text("지우기")
                            .foregroundColor(Color("MainColor"))
                    }
                }
                .foregroundColor(Color("MainColor"))
                .padding(.horizontal, 15)
                
                // 상품 리스트
                ScrollView {
                    ForEach(0..<productNames.count, id: \.self) { index in
                        HStack {
                            // 체크 버튼
                            Button(action: {
                                selectProducts[index] = !selectProducts[index]
                                if selectProducts == Array(repeating: true, count: productNames.count) {
                                    allSelect = true
                                    disabled = false
                                } else if selectProducts == Array(repeating: false, count: productNames.count) {
                                    disabled = true
                                } else {
                                    allSelect = false
                                    disabled = false
                                }
                            }) {
                                Image(systemName: selectProducts[index] ? "checkmark.circle.fill" : "checkmark.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20)
                                    .foregroundColor(Color("MainColor"))
                            }
                            
                            // 상품 이미지
                            AsyncImage(url: URL(string: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MME73_AV2?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1632861338000"), scale: 13)
                            
                            VStack(alignment: .leading, spacing: 18) {
                                // 상품명
                                Text(productNames[index])
                                    .fontWeight(.bold)
                                
                                // 상품 개수
                                HStack(spacing: 12) {
                                    // - 버튼
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
                                    
                                    // 개수
                                    Text("1")
                                        .font(.system(size: 17))
                                    
                                    // + 버튼
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
                                    
                                    // 상품 가격
                                    Text(prices[index])
                                        .fontWeight(.semibold)
                                }
                            }
                            Spacer()
                        }
                        .padding()
                        .padding(.vertical, 15)
                        .background(.white)
                        .padding(.vertical, 2)
                    }
                }
                
                HStack {
                    Text("결제금액")
                    Spacer()
                    // 총 금액
                    Text("₩1,347,000")
                }
                .fontWeight(.bold)
                .padding()
                .padding(.top, 10)
                
                // 결제
                Button(action: {
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(disabled ? .secondary : Color("MainColor"))
                            .frame(maxWidth: .infinity, maxHeight: 55, alignment: .center)
                        Text("결제")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .padding(.bottom, 90)
                .disabled(disabled)
            }
            .padding(.top, 59)
        }
        .ignoresSafeArea(.all)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
