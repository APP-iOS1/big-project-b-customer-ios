//
//  CaltalogueProductStore.swift
//  AppleMarket
//
//  Created by 홍진표 on 2022/12/28.
//

import Foundation
import FirebaseFirestore

class CatalogueProductStore: ObservableObject {
    
    @Published var catalogueProductStores: [CatalogueProduct] = []
    
    let database: Firestore = Firestore.firestore()
    
    func fetchData() -> Void {
        print("fetchData 실행")
        self.catalogueProductStores.removeAll()
        
        database.collection("CatalogueProduct").getDocuments { [self] snapshot, error in
                
                if let snapshot {
                    
                    for docs in snapshot.documents {
                        
                        let docData = docs.data()
                        
                        let id = docs.documentID
                        let productName: String = docData["productName"] as? String ?? ""
                        let device: [String] = docData["device"] as? [String] ?? []
                        let category: String = docData["category"] as? String ?? ""
                        let description: String = docData["description"] as? String ?? ""
                        let price: Int = docData["price"] as? Int ?? 0
                        let thumbnailImage: String = docData["thumbnailImage"] as? String ?? ""
                        let status: Int = docData["status"] as? Int ?? 0
                        
                        let model: [String]? = docData["model"] as? [String] ?? nil
                        let descriptionImages: [String]? = docData["descriptionImages"] as? [String] ?? nil
                        
                        let storage: [String] = docData["storage"] as? [String] ?? []
                        let color: [String]? = docData["color"] as? [String] ?? nil
                        
                        let netWork: [String]? = docData["netWork"] as? [String] ?? nil
                        
                        let processor: [String]? = docData["processor"] as? [String] ?? nil
                        let memory: [String]? = docData["memory"] as? [String] ?? nil
                        
                        let catalogueProduct: CatalogueProduct = CatalogueProduct(id: id, productName: productName, device: device, category: category, description: description, price: price, thumbnailImage: thumbnailImage, status: status, descriptionImages: descriptionImages, model: model, color: color, storage: storage, netWork: netWork, processor: processor, memory: memory)
                        
                        self.catalogueProductStores.append(catalogueProduct)
                    }
                    
                }
                
            }
        
        }
        
        func addCatalogueProduct(catalogueProduct: CatalogueProduct){
            database.collection("CatalogueProduct").document(catalogueProduct.id)
                .setData([
                    "id" : catalogueProduct.id,
                    "productName" : catalogueProduct.productName,
                    "device" : catalogueProduct.device,
                    "category" : catalogueProduct.category,
                    "description" : catalogueProduct.description,
                    "price" : catalogueProduct.price,
                    "thumbnailImage" : catalogueProduct.thumbnailImage,
                    "status" : catalogueProduct.status,
                    
                    "model" : catalogueProduct.model,
                    "descriptionImages" : catalogueProduct.descriptionImages,
                    
                    "storage" : catalogueProduct.storage,
                    "color" : catalogueProduct.color,

                    "netWork" : catalogueProduct.netWork,

                    "processor" : catalogueProduct.processor,
                    "memory" : catalogueProduct.memory,
                ])
            fetchData()
        }
}
