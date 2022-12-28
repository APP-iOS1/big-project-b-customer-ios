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
    
    func fetchCart(uid: String) {
        database.document(uid).collection("Cart").getDocuments { (snapshot, error) in
            
            if let snapshot {
                var tempCart: [Cart] = []
                for document in snapshot.documents {
                    let docData = document.data()
                    let productId: String = docData["productId"] as? String ?? ""
                    let productName: String = docData["productName"] as? String ?? ""
                    let productCount: Int = docData["productCount"] as? Int ?? 0
                    let productPrice: Int = docData["productPrice"] as? Int ?? 0
                    let productImage: String = docData["productImage"] as? String ?? ""
                    
                    let products: Cart = Cart(productId: productId, productName: productName, productCount: productCount, productPrice: productPrice, productImage: productImage)
                    
                    tempCart.append(products)
                }
                self.cartStore = tempCart
            }
        }
    }
    
    func addCart(uid: String, product: UserProduct, productCount: Int) {
        database.document(uid).collection("Cart").document(product.id)
            .setData([
                "id": product.id,
                "productName": product.productName,
                "device": product.device,
                "category": product.category,
                "description": product.description,
                "price": product.price,
                "images": product.images,
                "count": product.count,
                "storage": product.storage,
                "color": product.color,
                "status": product.status,
                "series": product.series,
                "createdAt": product.createdAt,
                "productCount": productCount
                
            ])
        
        fetchCart(uid: uid)
    }

    func updateCart(uid: String, product: Cart, productCount: Int){
        database.document(uid).collection("Cart").document(product.productId)
            .setData([
                "productId": product.productId,
                "productName": product.productName,
                "productCount": productCount,
                "productPrice": product.productPrice,
                "productImage": product.productImage
            ])
        fetchCart(uid: uid)
    }
    
    func removeCart(uid: String, product: Cart){
        database.document(uid).collection("Cart").document(product.productId)
            .delete()
        fetchCart(uid: uid)
    }
}
