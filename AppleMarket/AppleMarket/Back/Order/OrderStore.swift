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
    
    // MARK: - 주문 상세정보 리스트 조회 기능
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
    
    
    // MARK: - 주문 정보 추가 기능(임시)
    
    /**
     장바구니에 5개가 담겨있다가 5개를 결제해서 넘어온 상황이면
     [cart] , userId, address 중에서
     [cart]의 count횟수 만큼 반복문 ?
     */
    
    func addOrder(userId: String) {
        let uuid: String = UUID().uuidString
        let uuid2: String = UUID().uuidString
        let orderAddress: String = "test orderAddress"
        
        database.collection("ConsumerAccount").document(userId).collection("OrderList")
            .document(uuid)
            .setData(["id" : uuid,
                      "isDeposit" : false,
                      "orderAddress" : orderAddress,
                      "orderAt" : Timestamp(),
                      "orderTotalPrice" : 1000])
        
        database.collection("ConsumerAccount").document(userId).collection("OrderList").document(uuid).collection("DetailOrder")
            .document(uuid2)
            .setData(["productId" : uuid2,
                      "productName" : "iPhone_14_Pro_Max_256G_Silver",
                      "productPrice" : 10000,
                      "productCount" : 1])
        
        fetchOrderList(userId: userId)
        
    }
    
    // MARK: - 주문 정보 삭제 기능(임시)
    func removeOrder(userId: String, orderId: String) async throws {
        
        // 하위 컬랙션(DeatilOrder) 삭제
        let subCollection = database.collection("ConsumerAccount").document(userId).collection("OrderList").document(orderId).collection("DetailOrder")
        
        let snapshot = try await subCollection.getDocuments()
        
        for doc in snapshot.documents {
           try await doc.reference.delete()
        }
        
        // OrderList의 지정된 주문목록(document)를 삭제
        try await database.collection("ConsumerAccount").document(userId).collection("OrderList").document(orderId)
            .delete()
        
        fetchOrderList(userId: userId)
    }
    
}


