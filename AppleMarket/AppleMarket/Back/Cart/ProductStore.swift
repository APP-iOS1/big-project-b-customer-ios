//
//  ProductStore.swift
//  AppleMarket
//
//  Created by  장종환 on 2022/12/27.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class ProductStore: ObservableObject {
    
    @Published var productStore: [Product] = []
    let database = Firestore.firestore().collection("Product")
    
    func fetchProduct() {
        database.getDocuments { (snapshot, error) in
            self.productStore.removeAll()
            
            if let snapshot {
                for document in snapshot.documents {
                    let docData = document.data()
                    let id = docData["id"] as? String ?? ""
                    let productName = docData["productName"] as? String ?? ""
                    let device = docData["device"] as? String ?? ""
                    let category = docData["category"] as? String ?? ""
                    let description = docData["description"] as? String ?? ""
                    let price = docData["price"] as? Int ?? 0
                    let images = docData["images"] as? [String] ?? []
                    let count = docData["count"] as? Int ?? 0
                    let storage = docData["storage"] as? String ?? ""
                    let color = docData["color"] as? String ?? ""
                    let status = docData["status"] as? Int ?? 0
                    let createdAt = docData["createdAt"] as? Date ?? Date()
                    
                    let model = docData["model"] as? String ?? ""
                    
                    let products: Product = Product(id: id, productName: productName, device: device, category: category, description: description, price: price, images: images, count: count, storage: storage, color: color, status: color, createdAt: createdAt)
                    
                    self.productStore.append(products)
                }
            }
        }
    }
}
