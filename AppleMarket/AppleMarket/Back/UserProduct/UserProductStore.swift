//
//  UserProductStore.swift
//  AppleMarket
//
//  Created by 홍진표 on 2022/12/28.
//

import Foundation
import FirebaseFirestore

class UserProductStore: ObservableObject {
    
    @Published var userProductStores: [UserProduct] = []
    
    let database: Firestore = Firestore.firestore()
    
    func fetchData() -> Void {
        
        database.collection("UserProduct").getDocuments { snapshot, error in
            
            if let snapshot {
                
                for docs in snapshot.documents {
                    
                    let docData = docs.data()
                    
                    let id = docs.documentID
                    let productName: String = docData["productName"] as? String ?? ""
                    let device: [String] = docData["device"] as? [String] ?? []
                    let category: String = docData["category"] as? String ?? ""
                    let description: String = docData["description"] as? String ?? ""
                    let price: Int = docData["price"] as? Int ?? 0
                    let mainImage: String = docData["mainImage"] as? String ?? ""
                    let status: Int = docData["status"] as? Int ?? 0
                    
                    let model: [String]? = docData["model"] as? [String] ?? nil
                    let descriptionImages: [String]? = docData["descriptionImages"] as? [String] ?? nil
                    let recommendedProduct: [String]? = docData["recommendedProduct"] as? [String] ?? nil
                    
                    let storage: [Int] = docData["storage"] as? [Int] ?? []
                    let color: [String]? = docData["color"] as? [String] ?? nil
                    
                    let netWork: [String]? = docData["netWork"] as? [String] ?? nil
                    
                    let processor: [String]? = docData["processor"] as? [String] ?? nil
                    let memory: [String]? = docData["memory"] as? [String] ?? nil
                    
                    let userProduct: UserProduct = UserProduct(id: id, productName: productName, device: device, category: category, description: description, price: price, mainImage: mainImage, status: status, descriptionImages: descriptionImages, model: model, color: color, storage: storage, recommendedProduct: recommendedProduct, netWork: netWork, processor: processor, memory: memory)
                    
                    self.userProductStores.append(userProduct)
                }
            }
        }
    }
    
    func addUserProduct(userProduct: UserProduct){
        database.collection("UserProduct").document(userProduct.id)
            .setData([
                "id" : userProduct.id,
                "productName" : userProduct.productName,
                "device" : userProduct.device,
                "category" : userProduct.category,
                "description" : userProduct.description,
                "price" : userProduct.price,
                "mainImage" : userProduct.mainImage,
                "status" : userProduct.status,
                
                "model" : userProduct.model,
                "descriptionImages" : userProduct.descriptionImages,
                
                "storage" : userProduct.storage,
                "color" : userProduct.color,
                "recommendedProduct": userProduct.recommendedProduct,
                
                "netWork" : userProduct.netWork,

                "processor" : userProduct.processor,
                "memory" : userProduct.memory,
            ])
        fetchData()
    }
}
