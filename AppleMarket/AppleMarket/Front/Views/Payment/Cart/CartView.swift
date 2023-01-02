//
//  CartView.swift
//  AppleMarket
//
//  Created by hyemi on 2022/12/30.
//

import SwiftUI


struct CartView: View {
    @EnvironmentObject var userInfoStore: UserInfoStore
    
    @StateObject private var cartStore: CartStore = CartStore()
    
    var body: some View {
        VStack {
            if userInfoStore.userInfo?.userId != "" {
                if cartStore.cartStore.isEmpty {
                    EmptyCartView()
                } else {
                    CartSignInView()
                }
            } else {
                CartSignOutView()
            }
        }
//        .onAppear {
//            cartStore.fetchCart(uid: userInfoStore.userInfo?.userId ?? "")
//        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
