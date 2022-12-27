//
//  Cart.swift
//  AppleMarket
//
//  Created by  장종환 on 2022/12/27.
//

import Foundation

struct Cart: Hashable {
    var productId: String
    var productName: String
    var productCount: Int
    var productPrice: Int
}
