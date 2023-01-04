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
    
    var productDic: [String: [Product]] {
        var result: [String: [Product]] = [:]
        
        for product in productStore {
            if var selectedProduct = result[product.productName] {
                selectedProduct.append(product)
            } else {
                result[product.productName] = [product]
            }
        }
        return result
    }
    
    let database = Firestore.firestore().collection("Product")
    
    
    func fetchProduct() async {
        do {
            let snapshot = try await database.getDocuments()
            

            for document in snapshot.documents {
                let docData = document.data()
                let id: String = document.documentID
                let category: String = docData["category"] as? String ?? ""
                let color: String = docData["color"] as? String ?? ""
                let description: String = docData["description"] as? String ?? ""
                let device: String = docData["device"] as? String ?? ""
                let image: [String] = docData["image"] as? [String] ?? []
                let price: Int = docData["price"] as? Int ?? 0
                let productName: String = docData["productName"] as? String ?? ""
                let status: Int = docData["status"] as? Int ?? 0
                let storage: Int = docData["storage"] as? Int ?? 0
                
                let products: Product = Product(id: id, category: category, color: color, description: description, device: device, image: image, price: price, productName: productName, status: status, storage: storage, productCount: 1)
                
                self.productStore.append(products)

            }
        } catch {
            fatalError()
        }

        
    }
}
