//
//  UserInfoStore.swift
//  AppleMarket
//
//  Created by 진태영 on 2022/12/27.
//

import Foundation
import Firebase
import FirebaseFirestore

final class UserInfoStore: ObservableObject{
    @Published var userInfo: UserInfo?
    @Published var cart: [Cart] = []
    @Published var orderList: [OrderList] = []
    
    let database = Firestore.firestore()

}
