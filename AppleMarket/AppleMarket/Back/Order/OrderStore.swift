//
//  OrderStore.swift
//  AppleMarket
//
//  Created by 홍수만 on 2022/12/27.
//

import Foundation
import FirebaseFirestore

class OrderStore: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var orderList: [Order] = []
    @Published var detailOrderList: [DetailOrder] = []
    
    let database = Firestore.firestore()
    
    
    // TODO: 추후 유저 정보 추가시 매개변수로 userID를 받을 수 있도록 추가!
    func fetchOrderList(userId: String) {
        self.orderList.removeAll()
        
        /// 전체 주문목록 리스트 조회하기
        database.collection("ConsumerAccount").document(userId).collection("OrderList")
            .getDocuments{ (snapshot, error) in
                
                if let snapshot {
                    for document in snapshot.documents {
                        
                        let id: String = document.documentID
                        
                        let docData = document.data()
                        
                        let orderName: String = docData["orderName"] as? String ?? ""
                        let orderPhone: String = docData["orderPhone"] as? String ?? ""
                        let orderAddress: String = docData["orderAddress"] as? String ?? ""
                        let orderTotalPrice: Int = docData["orderTotalPrice"] as? Int ?? 0
                        let isDeposit: Bool = docData["isDeposit"] as? Bool ?? false
                        let orderAtTimeStamp: Timestamp = docData["orderAt"] as? Timestamp ?? Timestamp()
                        let orderAt: Date = orderAtTimeStamp.dateValue()
                        let detailOrderCount: Int = docData["detailOrderCount"] as? Int ?? 0
                        
                        let mainProductImage: String = docData["mainProductImage"] as? String ?? ""
                        let mainProductName: String = docData["mainProductName"] as? String ?? ""
                        //                        var detailOrderCount: Int = 0
                        //
                        //                        /// 상세 주문내역 확인하여 몇 종류의 상품인가 확인
                        //                        self.database.collection("ConsumerAccount").document(userId).collection("OrderList").document(id).collection("DetailOrder")
                        //                            .getDocuments{ (querySnapshot, error) in
                        //                                let count = querySnapshot!.count
                        //                                detailOrderCount = count
                        //                                print("count : \(count)")
                        //                                print("detailOrderCount : \(detailOrderCount)")
                        //                            }
                        
                        let order: Order = Order(id: id ,orderName: orderName, orderPhone: orderPhone, orderAddress: orderAddress, orderTotalPrice: orderTotalPrice, isDeposit: isDeposit, orderAt: orderAt, detailOrderCount: detailOrderCount, mainProductImage: mainProductImage, mainProductName: mainProductName)
                        
                        self.orderList.append(order)
                    }
                }
            }
    }
    
    // MARK: - 주문 상세정보 리스트 조회 기능
    func fetchDetailOrderList(userId: String, order: Order) {
        self.detailOrderList.removeAll()
        
        database.collection("ConsumerAccount").document(userId).collection("OrderList").document(order.id ?? "").collection("DetailOrder")
            .getDocuments{ (snapshot, error) in
                
                if let snapshot {
                    for document in snapshot.documents {
                        let id: String = document.documentID
                        
                        let docData = document.data()
                        
                        let productName: String = docData["productName"] as? String ?? ""
                        let productPrice: Int = docData["productPrice"] as? Int ?? 0
                        let productCount: Int = docData["productCount"] as? Int ?? 0
                        let productImage: String = docData["productImage"] as? String ?? ""
                        
                        let detailOrder = DetailOrder(
                            id: id,
                            productName: productName,
                            productCount: productCount,
                            productPrice: productPrice,
                            productImage: productImage)
                        
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
    
    func addOrder(user: UserInfo, products: [Product], orderInfo: Order) {
        let uuid: String = UUID().uuidString
        let currentTime: Timestamp = Timestamp()
        
        var orderTotalPrice: Int = 0
        
        products.forEach { product in
            
            let productIDproductID: String = UUID().uuidString
            
            orderTotalPrice += product.price * product.productCount
            print("orderTotalPrice: \(orderTotalPrice)")
            
            database.collection("ConsumerAccount").document(user.userId).collection("OrderList").document(uuid).collection("DetailOrder")
                .document(productIDproductID)
                .setData(["productId" : productIDproductID,
                          "productName" : product.productName,
                          "productPrice" : product.price,
                          "productCount" : product.productCount])
        }
        
        let detailOrderCount: Int = products.count
        let mainProductImage: String = products.first?.image.first ?? "no image"
        let mainProductName: String = products.first?.productName ?? "no item"
        
        database.collection("ConsumerAccount").document(user.userId).collection("OrderList")
            .document(uuid)
            .setData(["id" : uuid,
                      "isDeposit" : false,
                      "detailOrderCount" : detailOrderCount,
                      "mainProductImage" : mainProductImage,
                      "mainProductName" : mainProductName,
                      "orderPhone" : orderInfo.orderPhone,
                      "orderAddress" : orderInfo.orderAddress,
                      "orderAt" : currentTime,
                      "orderState" : 0,
                      "orderTotalPrice" : orderTotalPrice])
        
        
        /// ProductEntity를 파이어베이스 map 형식에 맞게 [String : Any] 로 변환하는 메서드
                func productsToDictionary(products: [Product]) -> [[String : Any]] {
                    var result: [[String : Any]] = []
                    for product in products {
                        var productDict: [String : Any] = [:]
                        productDict["id"] = product.id
                        productDict["productName"] = product.productName
                        productDict["device"] = product.device
                        productDict["category"] = product.category
                        productDict["description"] = product.description
                        productDict["price"] = product.price
                        productDict["images"] = product.image
        
                        productDict["storage"] = product.storage
                        productDict["color"] = product.color
                        productDict["status"] = product.status
                        result.append(productDict)
                    }
                    return result
                }
        
                database.collection("Order")
                    .document(uuid)
                    .setData(["id" : uuid,
                              "userId" : user.userId,
                              "isChecked" : false,
                              "isDeposit" : false,
                              "orderAt" : currentTime,
                              "orderState" : 0,
                              "receiver" : ["address" : orderInfo.orderAddress,
                                            "phone" : orderInfo.orderPhone,
                                            "userName" : orderInfo.orderName],
                              "sender" : ["address" : user.address,
                                          "phone" : user.phoneNumber,
                                          "userName" : user.userName],
                              "totalPayed" : orderTotalPrice,
                              "products" : productsToDictionary(products: products)
                             ])
        
        fetchOrderList(userId: user.userId)
        
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
    
    // MARK: - 결제창 넘어갈 때
    func searchProductInfo(carts: [CartProduct]) {
        
        carts.forEach { cartProduct in
            database.collection("Product")
                .whereField("productName", isEqualTo: cartProduct.productName)
                .whereField("storage", isEqualTo: cartProduct.storage)
                .whereField("color", isEqualTo: cartProduct.color)
                .getDocuments{ (snapshot, error) in
                    
                    if let snapshot {
                        for document in snapshot.documents {
                            let docData = document.data()
                            
                            let id: String = docData["id"] as? String ?? ""
                            let category: String = docData["category"] as? String ?? ""
                            let color: String = docData["color"] as? String ?? ""
                            let description: String = docData["description"] as? String ?? ""
                            let device: String = docData["device"] as? String ?? ""
                            let image: [String] = docData["image"] as? [String] ?? [""]
                            let price: Int = docData["price"] as? Int ?? 0
                            let productName: String = docData["productName"] as? String ?? ""
                            let status: Int = docData["status"] as? Int ?? 0
                            let storage: Int = docData["storage"] as? Int ?? 0
                            let productCount: Int = docData["productCount"] as? Int ?? 0
                            
                            let product = Product(id: id ,
                                                  category: category ,
                                                  color: color ,
                                                  description: description ,
                                                  device: device ,
                                                  image: image ,
                                                  price: price ,
                                                  productName: productName ,
                                                  status: status ,
                                                  storage: storage ,
                                                  productCount: productCount )
                            
                            self.products.append(product)
                        }
                    }
                }
            
        }
        
    }
    
}


