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
    var createdAt: Date
    var descroption: String
    var device: String
    var image: [String]
    var price: Int
    var productName: String
    var status: String
    var storage: String
}

