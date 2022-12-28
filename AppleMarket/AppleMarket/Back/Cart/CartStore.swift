//
//  CartStore.swift
//  AppleMarket
//
//  Created by  장종환 on 2022/12/27.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
class CartStore: ObservableObject {
    @Published var cartStore: [Cart] = []
    let database = Firestore.firestore().collection("ConsumerAccount")
    
    func fetchCart() {
        database.document("mUzu710p6zgGOPk64s7D6DhMIq32").collection("Cart").getDocuments { (snapshot, error) in
            self.cartStore.removeAll()
            
            if let snapshot {
                for document in snapshot.documents {
                    let docData = document.data()
                    let productId: String = docData["productId"] as? String ?? ""
                    let productName: String = docData["productName"] as? String ?? ""
                    let productCount: Int = docData["productCount"] as? Int ?? 0
                    let productPrice: Int = docData["productPrice"] as? Int ?? 0
                    
                    let products: Cart = Cart(productId: productId, productName: productName, productCount: productCount, productPrice: productPrice)
                    
                    self.cartStore.append(products)
                }
            }
        }
    }
    
    func addCart(product: Product, productCount: Int) {
        database.document("mUzu710p6zgGOPk64s7D6DhMIq32").collection("Cart").document(product.id)
            .setData([
                "productId": product.id,
                "productName": product.productName,
                "productCount": productCount,
                "productPrice": product.price
            ])
        
        fetchCart()
    }
}
