//
//  Cart.swift
//  AppleMarket
//
//  Created by  장종환 on 2022/12/27.
//

import Foundation

struct Cart: Hashable, Identifiable {
//    var productId: String
//    var productName: String
//    var productCount: Int
//    var productPrice: Int
//    var productImage: String
    
    var id: String
    var productName: String
    var device: [String]
    var category: String
    var storage: String
    var color: String
    var productCount: Int
    var image: String
    var price: Int
}
