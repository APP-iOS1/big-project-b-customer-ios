//
//  CartSignInView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI
import FirebaseAuth

struct CartSignInView: View {
    @State private var userId = Auth.auth().currentUser?.uid ?? ""
    @State private var selectProducts: [Bool] = Array(repeating: false, count: 10) // 선택 상품 확인
    @State private var allSelect: Bool = false // 상품 전체선택 확인
    @State private var disabled: Bool = false // 결제 버튼 활성화
    @State private var emptyCart: Bool = false
    @StateObject private var cartStore: CartStore = CartStore()
    @StateObject private var productStore: ProductStore = ProductStore()
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    
    var body: some View {
        NavigationStack {
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
                                selectProducts = Array(repeating: false, count: cartStore.cartStore.count)
                                disabled = true
                            } else {
                                selectProducts = Array(repeating: true, count: cartStore.cartStore.count)
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
                        
                        NavigationLink(destination: EmptyCartView(), isActive: $emptyCart) {
                            // 지우기
                            Button(action: {
                                for index in 0..<cartStore.cartStore.count {
                                    if selectProducts[index] {
                                        cartStore.removeCart(uid: userId, product: Cart(productId: cartStore.cartStore[index].productId, productName: cartStore.cartStore[index].productName, productCount: cartStore.cartStore[index].productCount, productPrice: cartStore.cartStore[index].productPrice, productImage: cartStore.cartStore[index].productImage))
                                    }
                                }
                                selectProducts = Array(repeating: false, count: cartStore.cartStore.count)
                                
                                if cartStore.cartStore.isEmpty {
                                    emptyCart = true
                                }
                            }) {
                                Text("지우기")
                                    .foregroundColor(Color("MainColor"))
                            }
                        }
                    }
                    .foregroundColor(Color("MainColor"))
                    .padding(.horizontal, 15)
                    
                    // 상품 리스트
                    ScrollView {
                        ForEach(0..<cartStore.cartStore.count, id: \.self) { index in
                            HStack {
                                // 체크 버튼
                                Button(action: {
                                    selectProducts[index] = !selectProducts[index]
                                    if (0..<cartStore.cartStore.count).map({selectProducts[$0]}) == Array(repeating: true, count: cartStore.cartStore.count) {
                                        allSelect = true
                                        disabled = false
                                    } else if 10 - selectProducts.filter({!$0}).count == cartStore.cartStore.count {
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
                                AsyncImage(url: URL(string: cartStore.cartStore[index].productImage), scale: 13)
                                    .frame(width: 100, height: 100)
                                
                                VStack(alignment: .leading, spacing: 18) {
                                    // 상품명
                                    Text(cartStore.cartStore[index].productName)
                                        .fontWeight(.bold)
                                    
                                    // 상품 개수
                                    HStack(spacing: 12) {
                                        // - 버튼
                                        Button(action: {
                                            let price = cartStore.cartStore[index].productPrice / cartStore.cartStore[index].productCount
                                            if cartStore.cartStore[index].productCount > 1 {
                                                cartStore.cartStore[index].productCount -= 1
                                                cartStore.updateCart(uid: userId, product: Cart(productId: cartStore.cartStore[index].productId, productName: cartStore.cartStore[index].productName, productCount: cartStore.cartStore[index].productCount, productPrice: price * cartStore.cartStore[index].productCount, productImage: cartStore.cartStore[index].productImage), productCount: cartStore.cartStore[index].productCount)
                                            }
                                        }) {
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
                                        Text("\(cartStore.cartStore[index].productCount)")
                                            .font(.system(size: 17))
                                        
                                        // + 버튼
                                        Button(action: {
                                            let price = cartStore.cartStore[index].productPrice / cartStore.cartStore[index].productCount
                                          
                                            if cartStore.cartStore[index].productCount < 10 {
                                                cartStore.cartStore[index].productCount += 1
                                                cartStore.updateCart(uid: userId, product: Cart(productId: cartStore.cartStore[index].productId, productName: cartStore.cartStore[index].productName, productCount: cartStore.cartStore[index].productCount, productPrice: price * cartStore.cartStore[index].productCount, productImage: cartStore.cartStore[index].productImage), productCount: cartStore.cartStore[index].productCount)
                                            }
                                        }) {
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
                                        Text("₩\(cartStore.cartStore[index].productPrice)")
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
                        Text("₩\(setTotalPrice())")
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
                    .disabled(disabled)
                }
                .padding(.top, 59)
                .padding(.bottom, 90)
            }
            .ignoresSafeArea(.all)
        }
        .onAppear {
            cartStore.fetchCart(uid: userId)
        }
    }
    
    func setTotalPrice() -> Int {
        var totalPrice = 0
        for index in 0..<cartStore.cartStore.count {
            if selectProducts[index] {
                totalPrice += cartStore.cartStore[index].productPrice
            }
        }
        return totalPrice
    }
}

struct CartSignInView_Previews: PreviewProvider {
    static var previews: some View {
        CartSignInView()
    }
}
