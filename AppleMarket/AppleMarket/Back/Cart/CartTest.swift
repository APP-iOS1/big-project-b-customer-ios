//
//  CartTest.swift
//  AppleMarket
//
//  Created by  장종환 on 2022/12/27.
//

import SwiftUI

struct CartTest: View {
    
    @StateObject private var productStore = ProductStore()
    @StateObject private var cartStore = CartStore()
    var uid: String = "mUzu710p6zgGOPk64s7D6DhMIq32"
    
    var body: some View {
        VStack {
            
            ForEach(productStore.productStore) { item in
                Text("\(item.productName)")
            }
            
            
            Button {
//                cartStore.addCart(uid: uid, product: Product(id: "asdfasdfasdf", category: "iPhone", color: "silver", createdAt: Date(), descroption: "필요한 정보를 한눈에 볼 수 있는 상시표시 기능을 탑재한, 더 밝아진 15.5cm Super Retina XDR 디스플레이¹", device: "iPhone", image: ["test"], price: 1000, productName: "아이폰14", status: "0", storage: "128"), productCount: 0)
            } label: {
                Text("추가")
            }
            
            Button {
//                cartStore.updateCart(uid: uid, product: Product(id: "asdfasdfasdf", category: "iPhone", color: "silver", createdAt: Date(), descroption: "필요한 정보를 한눈에 볼 수 있는 상시표시 기능을 탑재한, 더 밝아진 15.5cm Super Retina XDR 디스플레이¹", device: "iPhone", image: ["test"], price: 1000, productName: "아이폰14", status: "0", storage: "128"), productCount: 3)
            } label: {
                Text("변경")
            }
            
            Button {
//                cartStore.removeCart(uid: uid, product: Product(id: "asdfasdfasdf", category: "iPhone", color: "silver", createdAt: Date(), descroption: "필요한 정보를 한눈에 볼 수 있는 상시표시 기능을 탑재한, 더 밝아진 15.5cm Super Retina XDR 디스플레이¹", device: "iPhone", image: ["test"], price: 1000, productName: "아이폰14", status: "0", storage: "128"))
            } label: {
                Text("삭제")
            }
            
        }
        .onAppear {
            productStore.fetchProduct()
        }
    }
}

struct CartTest_Previews: PreviewProvider {
    static var previews: some View {
        CartTest()
    }
}
