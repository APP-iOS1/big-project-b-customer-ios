//
//  Product.swift
//  AppleMarket
//
//  Created by  장종환 on 2022/12/27.
//

import Foundation

struct Product: Hashable, Identifiable {
    var id: String
    var category: String
    var color: String
    var description: String
    var device: String
    var image: [String]
    var price: Int
    var productName: String
    var status: Int    
    var storage: Int
    
    var productCount: Int
    
    var totalPrice: Int {
        productCount * price
    }
}

