//
//  CartView.swift
//  AppleMarket
//
//  Created by hyemi on 2022/12/30.
//

import SwiftUI
import FirebaseAuth

struct CartView: View {
    @State private var userId = Auth.auth().currentUser?.uid ?? ""
    @StateObject private var cartStore: CartStore = CartStore()
    
    var body: some View {
        VStack {
            if Auth.auth().currentUser?.uid != "" {
                if cartStore.cartStore.isEmpty {
                    EmptyCartView()
                } else {
                    CartSignInView()
                }
            } else {
                CartSignOutView()
            }
        }
        .onAppear {
            cartStore.fetchCart(uid: userId)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
