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
            if userInfoStore.state == .signedIn {
                CartSignInView()
                
            } else {
                CartSignOutView()
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
