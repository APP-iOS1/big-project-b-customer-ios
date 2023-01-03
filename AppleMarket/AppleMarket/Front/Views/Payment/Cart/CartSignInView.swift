//
//  CartSignInView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct CartSignInView: View {
    @EnvironmentObject var userInfoStore: UserInfoStore
    @EnvironmentObject var cartStore: CartStore
    
    var body: some View {
        NavigationStack {
            if cartStore.cartStore.isEmpty {
                EmptyCartView()
            } else {
                CartView(cartCount: cartStore.cartStore.count)
            }
        }
        .onAppear {
            if userInfoStore.state == .signedIn {
                cartStore.fetchCart(uid: userInfoStore.userInfo?.userId ?? "")
            }
        }
    }
}

struct CartSignInView_Previews: PreviewProvider {
    static var previews: some View {
        CartSignInView()
            .environmentObject(CartStore())
    }
}
