//
//  OrderList.swift
//  AppleMarket
//
//  Created by 윤현기 on 2022/12/27.
//

import Foundation

struct Order: Identifiable {
    
    /// 주문내역 ID
    var id: String?
    
    /// 주문받는 사람 이름
    var orderName: String
    
    /// 주문받는 사람 핸드폰번호
    var orderPhone: String
    
    /// 주문 주소
    var orderAddress: String
    
    /// 최종 결제 금액
    var orderTotalPrice: Int?
    
    /// 입금 여부
    var isDeposit: Bool?
    
    /// 주문 날짜
    var orderAt: Date?
    
    /// 주문 날짜 Formmatt  변경
    var orderDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        
        let orderDateAt = orderAt ?? Date()
        
        return dateFormatter.string(from: orderDateAt)
    }
    
    /// 주문 품목 갯수
    var detailOrderCount: Int?
    
    /// 메인 제품을 제외한 나머지 제품 갯수
    var otherProductCount: Int {
        (detailOrderCount ?? 1) - 1
    }
    
    /// 주문 목록 메인 제품 이미지
    var mainProductImage: String?
    
    /// 주문 목록 메인 제품 이름
    var mainProductName: String?
}

struct CartProduct: Identifiable {
    var id: String
    var productName: String
    var device: [String]
    var category: String
    var storage: String
    var color: String
    var productCount: Int
}
