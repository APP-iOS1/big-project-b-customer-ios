//
//  UserInfo.swift
//  AppleMarket
//
//  Created by 진태영 on 2022/12/27.
//

import Foundation

struct UserInfo: Codable, Hashable{
    var userId: String // id
    var userName: String // 이름
    var userEmail: String // 이메일
    var address: String  // 주소
    var phoneNumber: String  // 전화번호
    var myDevices: [MyDevice] = [] // 내 기기
    var recentProduct: [String] = []  // 최근 조회 상품
}

struct MyDevice: Codable, Hashable{
    var productName: String  // 기기 이름
    var productImage: String  // 기기 이미지 주소
}
