//
//  OrderList.swift
//  AppleMarket
//
//  Created by 윤현기 on 2022/12/27.
//

import Foundation

struct Order: Identifiable {
    
    /// 주문내역 ID
    var id: String
    
    /// 주문 주소
    var orderAddress: String
    
    /// 최종 결제 금액
    var orderTotalPrice: Int
    
    /// 입금 여부
    var isDeposit: Bool
    
    /// 주문 날짜
    var orderAt: Date 
    
    /// 주문 날짜 Formmatt  변경
    var orderDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        
        let orderDateAt = orderAt
        
        return dateFormatter.string(from: orderDateAt)
    }
}
