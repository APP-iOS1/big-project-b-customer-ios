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
        //MARK: 배열을 비워줘야 해서 추가합니다! _ 소비자프론트 이석준
        userProductStores.removeAll()
        
        database.collection("UserProduct").getDocuments { snapshot, error in
            
            if let snapshot {
                
                for docs in snapshot.documents {
                    
                    let docData = docs.data()
                    
                    let id = docs.documentID
                    let category: String = docData["Category"] as? String ?? ""
                    let color: [String?] = docData["Color"] as? [String] ?? []
                    let productName: String = docData["ProductName"] as? String ?? ""
                    let device: String = docData["Device"] as? String ?? ""
                    let description: String = docData["Description"] as? String ?? ""
                    let price: Int = docData["Price"] as? Int ?? 0
                    let images: [String?] = docData["Images"] as? [String] ?? []
                    let count: Int = docData["Count"] as? Int ?? 0
                    let status: Int = docData["Status"] as? Int ?? 0
                    let series: [String?] = docData["Series"] as? [String] ?? []
                    let storage: [Int] = docData["Storage"] as? [Int] ?? []
                    let createdAt: Date = docData["CreatedAt"] as? Date ?? Date()
                    
                    let userProduct = UserProduct(id: id, productName: productName, device: device, category: category, description: description, price: price, images: images, count: count, storage: storage, color: color, status: status, createdAt: createdAt, series: series)
                    
                    self.userProductStores.append(userProduct)
                }
            }
        }
    }
}
