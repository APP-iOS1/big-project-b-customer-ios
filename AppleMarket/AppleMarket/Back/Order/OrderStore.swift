//
//  OrderStore.swift
//  AppleMarket
//
//  Created by 홍수만 on 2022/12/27.
//

import Foundation
import FirebaseFirestore

class OrderStore: ObservableObject {
    
    @Published var orderList: [Order] = []
    @Published var detailOrderList: [DetailOrder] = []
    
    let database = Firestore.firestore()
    
    
    // TODO: 추후 유저 정보 추가시 매개변수로 userID를 받을 수 있도록 추가!
    func fetchOrderList(userId: String) {
        self.orderList.removeAll()
        
        database.collection("ConsumerAccount").document(userId).collection("OrderList")
            .getDocuments{ (snapshot, error) in
                
                if let snapshot {
                    for document in snapshot.documents {
                        let id: String = document.documentID
                        
                        let docData = document.data()
                        
                        let orderAddress: String = docData["orderAddress"] as? String ?? ""
                        
                        let orderTotalPrice: Int = docData["orderTotalPrice"] as? Int ?? 0
                        
                        let isDeposit: Bool = docData["isDeposit"] as? Bool ?? false
                        
                        let orderAtTimeStamp: Timestamp = docData["orderAt"] as? Timestamp ?? Timestamp()
                        let orderAt: Date = orderAtTimeStamp.dateValue()
                        
                        let order: Order = Order(id: id, orderAddress: orderAddress, orderTotalPrice: orderTotalPrice, isDeposit: isDeposit, orderAt: orderAt)
                        
                        self.orderList.append(order)
                        
                    }
                }
            }
    }
    
    func fetchDetailOrderList(userId: String, order: Order) {
        self.detailOrderList.removeAll()
        
        database.collection("ConsumerAccount").document(userId).collection("OrderList").document(order.id).collection("DetailOrder")
            .getDocuments{ (snapshot, error) in
                
                if let snapshot {
                    for document in snapshot.documents {
                        let id: String = document.documentID
                        
                        let docData = document.data()
                        
                        let productName: String = docData["productName"] as? String ?? ""
                        
                        let productPrice: Int = docData["productPrice"] as? Int ?? 0
                        
                        let productCount: Int = docData["productCount"] as? Int ?? 0
                        
                        let detailOrder: DetailOrder = DetailOrder(id: id, productName: productName, productCount: productCount, productPrice: productPrice)
                        
                        self.detailOrderList.append(detailOrder)
                        
                    }
                }
            }
    }
    
    func addOrder
    /*
    func addPostit(_ postit: Postit) {
        database.collection("Postits")
            .document(postit.id)
            .setData(["username": postit.username,
                      "memo": postit.memo,
                      "colorIndex": postit.colorIndex,
                      "createdAt": postit.createdAt])
        
        fetchPostits()
    }
    
    func removePostit(_ postit: Postit) {
        database.collection("Postits")
            .document(postit.id).delete()
        fetchPostits()
    }
    */
}


