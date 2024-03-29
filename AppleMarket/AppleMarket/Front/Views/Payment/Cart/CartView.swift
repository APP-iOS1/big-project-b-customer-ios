//
//  CartView.swift
//  AppleMarket
//
//  Created by hyemi on 2023/01/03.
//

import SwiftUI

struct CartView: View {
    @State private var selectProducts: [Bool] = Array(repeating: false, count: 10) // 선택 상품 확인
    @State private var allSelect: Bool = false // 상품 전체선택 확인
    @State private var disabled: Bool = false // 결제 버튼 활성화
    @State private var isEmptyCart: Bool = false
    @EnvironmentObject var userInfoStore: UserInfoStore
    @EnvironmentObject var cartStore: CartStore
    @EnvironmentObject var productStore: ProductStore
    var cartCount: Int
    
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
                        
                        // 지우기
                        Button(action: {
                            for index in 0..<cartStore.cartStore.count {
                                if selectProducts[index] {
                                    cartStore.removeCart(uid: userInfoStore.userInfo?.userId ?? "",
                                                         product: Cart(id: cartStore.cartStore[index].id,
                                                                       productName: cartStore.cartStore[index].productName,
                                                                       device: cartStore.cartStore[index].device,
                                                                       category: cartStore.cartStore[index].category,
                                                                       storage: cartStore.cartStore[index].storage,
                                                                       color: cartStore.cartStore[index].color,
                                                                       productCount: cartStore.cartStore[index].productCount,
                                                                       image: cartStore.cartStore[index].image,
                                                                       price: cartStore.cartStore[index].price))
                                }
                            }
                            selectProducts = Array(repeating: false, count: cartStore.cartStore.count)
                            
                            if cartStore.cartStore.isEmpty {
                                isEmptyCart.toggle()
                            }
                        }) {
                            Text(selectProducts.filter{$0}.count == 0 ? "" : "지우기")
                                .foregroundColor(Color("MainColor"))
                        }
                        .navigationDestination(isPresented: $isEmptyCart) {
                            EmptyCartView()
                        }
                    }
                    .foregroundColor(Color("MainColor"))
                    .padding(.horizontal, 15)
                    
                    // 상품 리스트
                    ScrollView {
                        ForEach(0..<cartStore.cartStore.count, id: \.self) { index in
                            HStack(spacing: 15) {
                                // 체크 버튼
                                Button(action: {
                                    selectProducts[index] = !selectProducts[index]
                                    // 상품 전체 선택
                                    if selectProducts == Array(repeating: true, count: cartStore.cartStore.count) {
                                        allSelect = true
                                        disabled = false
                                    // 상품 전체 선책 해제
                                    } else if selectProducts == Array(repeating: false, count: cartStore.cartStore.count) {
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
                                AsyncImage(url: URL(string: cartStore.cartStore[index].image)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 80)
                                
                                VStack(alignment: .leading, spacing: 18) {
                                    // 상품명
                                    Text(cartStore.cartStore[index].productName)
                                        .fontWeight(.bold)
                                    
                                    // 상품 개수
                                    HStack(spacing: 10) {
                                        // - 버튼
                                        Button(action: {
                                            let price = cartStore.cartStore[index].price / cartStore.cartStore[index].productCount
                                            if cartStore.cartStore[index].productCount > 1 {
                                                cartStore.cartStore[index].productCount -= 1
                                                cartStore.updateCart(uid: userInfoStore.userInfo?.userId ?? "",
                                                                     product: Cart(id: cartStore.cartStore[index].id,
                                                                                   productName: cartStore.cartStore[index].productName,
                                                                                   device: cartStore.cartStore[index].device,
                                                                                   category: cartStore.cartStore[index].category,
                                                                                   storage: cartStore.cartStore[index].storage,
                                                                                   color: cartStore.cartStore[index].color,
                                                                                   productCount: cartStore.cartStore[index].productCount,
                                                                                   image: cartStore.cartStore[index].image,
                                                                                   price: price * cartStore.cartStore[index].productCount),
                                                                     productCount: cartStore.cartStore[index].productCount)
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
                                            let price = cartStore.cartStore[index].price / cartStore.cartStore[index].productCount
                                            
                                            if cartStore.cartStore[index].productCount < 10 {
                                                cartStore.cartStore[index].productCount += 1
                                                cartStore.updateCart(uid: userInfoStore.userInfo?.userId ?? "",
                                                                     product: Cart(id: cartStore.cartStore[index].id,
                                                                                   productName: cartStore.cartStore[index].productName,
                                                                                   device: cartStore.cartStore[index].device,
                                                                                   category: cartStore.cartStore[index].category,
                                                                                   storage: cartStore.cartStore[index].storage,
                                                                                   color: cartStore.cartStore[index].color,
                                                                                   productCount: cartStore.cartStore[index].productCount,
                                                                                   image: cartStore.cartStore[index].image,
                                                                                   price: price * cartStore.cartStore[index].productCount),
                                                                     productCount: cartStore.cartStore[index].productCount)
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
                                        Text("₩\(cartStore.cartStore[index].price)")
                                            .fontWeight(.semibold)
                                            .frame(width: 110, alignment: .leading)
                                    }
                                }
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
                    NavigationLink(destination: PaymentView(carts: setTotalProduct())) {
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
            if userInfoStore.state == .signedIn {
                cartStore.fetchCart(uid: userInfoStore.userInfo?.userId ?? "")
                selectProducts = Array(repeating: false, count: cartCount)
            }
        }
    }
    
    func setTotalPrice() -> Int {
        var totalPrice = 0
        for index in 0..<cartStore.cartStore.count {
            if selectProducts[index] {
                totalPrice += cartStore.cartStore[index].price
            }
        }
        return totalPrice
    }
    
    func setTotalProduct() -> [Cart] {
        var cart = [Cart]()
        for index in 0..<cartStore.cartStore.count {
            if selectProducts[index] {
                cart.append(cartStore.cartStore[index])
            }
        }
        return cart
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cartCount: 0)
            .environmentObject(CartStore())
            .environmentObject(ProductStore())
    }
}
