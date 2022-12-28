//
//  DetailOrder.swift
//  AppleMarket
//
//  Created by 윤현기 on 2022/12/27.
//

import Foundation

struct DetailOrder: Identifiable {
    // 제품 ID
    var id: String
    
    // 제품 이름
    var productName: String
    
    // 주문 수량
    var productCount: Int
    
    // 제품 가격
    var productPrice: Int
    
    
    var producTotalPrice: Int {
        productPrice * productCount
    }
}
