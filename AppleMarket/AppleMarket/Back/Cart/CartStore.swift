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
                    
                    let id: String = docData["id"] as? String ?? ""
                    let productName: String = docData["productName"] as? String ?? ""
                    let device: [String] = docData["device"] as? [String] ?? [""]
                    let image: String = docData["images"] as? String ?? ""
                    let category: String = docData["category"] as? String ?? ""
                    let storage: String = docData["storage"] as? String ?? ""
                    let color: String = docData["color"] as? String ?? ""
                    let productCount: Int = docData["productCount"] as? Int ?? 0
                    let price: Int = docData["price"] as? Int ?? 0
                    
                    let products: Cart = Cart(id: id,
                                              productName: productName,
                                              device: device,
                                              category: category,
                                              storage: storage,
                                              color: color,
                                              productCount: productCount,
                                              image: image,
                                              price: price)
                    
                    tempCart.append(products)
                }
                self.cartStore = tempCart
            }
        }
    }
    
    func addCart(uid: String, product: CatalogueProduct, productCount: Int) {
        database.document(uid).collection("Cart").document(product.id)
            .setData([
                "id": product.id,
                "productName": product.productName,
                "device": product.device,
                "category": product.category,
                "description": product.description,
                "price": product.price,
                "image": product.thumbnailImage,
                "storage": product.storage,
                "color": product.color,
                "status": product.status,
                "series": product.model,
                "productCount": productCount
                
            ])
        
        fetchCart(uid: uid)
    }

    func updateCart(uid: String, product: Cart, productCount: Int){
        database.document(uid).collection("Cart").document(product.id)
            .setData([
                "id": product.id,
                "productName": product.productName,
                "device": product.device,
                "category": product.category,
                "price": product.price,
                "image": product.image,
                "storage": product.storage,
                "color": product.color,
                "productCount": productCount
            ])
        fetchCart(uid: uid)
    }
    
    func removeCart(uid: String, product: Cart){
        database.document(uid).collection("Cart").document(product.id)
            .delete()
        fetchCart(uid: uid)
    }
}
