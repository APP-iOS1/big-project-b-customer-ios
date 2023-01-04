//
//  UserInfoStore.swift
//  AppleMarket
//
//  Created by 진태영 on 2022/12/27.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

final class UserInfoStore: ObservableObject{
    @Published var state: SignInState = .signedOut
    @Published var userInfo: UserInfo?
    @Published var myDevices: [MyDevice] = []
    @Published var cart: [Cart] = []
    @Published var signUpState: Bool = false
    
    let database = Firestore.firestore()
    
    var user: FirebaseAuth.User?{
        didSet{
            objectWillChange.send()
        }
    }
    
    var errorMessage: String = ""
    
    enum SignInState{
        case signedIn
        case signedOut
    }
    
    func emailAuthListenToAuthState(){
        Auth.auth().addStateDidChangeListener(){[weak self] _, user in
            guard let self = self else{
                return
            }
            
            self.user = user
        }
    }
    
    func emailAuthSignIn(email: String, password: String){
        self.errorMessage = ""
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if let error = error{
                self.errorMessage = error.localizedDescription
                print("Login error: \(self.errorMessage)")
            }
            
            if let user = result?.user{
                
                self.user = user
                self.userInfo = UserInfo(userId: user.uid, userName: "", userEmail: user.email ?? "", address: "", phoneNumber: "")
                print("complete login")
                print("userId: ", self.userInfo?.userId as Any)
                print("userId", user.uid)
                print("\(self.userInfo?.userEmail ?? "nil")")
                // 앱실행 할 때 기기에 저장되어있는 로그인, 비밀번호 기록으로 자동 로그인이 되도록 하는 값을 저장함
                // 기기 core저장소에 email 키에 email 값을 저장
                UserDefaults.standard.set(email, forKey: UserDefaults.Keys.email.rawValue)
                // 기기 core저장소에 password 키에 password 값을 저장
                UserDefaults.standard.set(password, forKey: UserDefaults.Keys.password.rawValue)
                self.state = .signedIn
                self.fetchUserInfo()
            }
        }
    }
    
    func emailAuthSignUp(email: String, userName: String, password: String, address: String, phoneNumber: String, myDevices: [MyDevice]){
        self.errorMessage = ""
        Auth.auth().createUser(withEmail: email, password: password){result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
            
            switch result{
            case .none:
                self.errorMessage = "계정을 생성할 수 없습니다."
            case .some(_):
                let userId = result?.user.uid ?? UUID().uuidString
                let userName = userName
                let userEmail = email
                let address = address
                let phoneNumber = phoneNumber
                let myDevices = myDevices
                self.firebaseSignUp(userId: userId, userName: userName, userEmail: userEmail, address: address, phoneNumber: phoneNumber, myDevices: myDevices)
            }
        }
    }
    
    func firebaseSignUp(userId: String, userName: String, userEmail: String, address: String, phoneNumber: String, myDevices: [MyDevice]){
        database.collection("ConsumerAccount").document(userId)
            .setData([
                "userId" : userId,
                "userName" : userName,
                "userEmail" : userEmail,
                "address": address,
                "phoneNumber": phoneNumber,
                "myDevices": myDevices
            ])
    }
    
    func emailAuthSignOut(){
        self.errorMessage = ""
        do{
            try Auth.auth().signOut()
            UserDefaults.standard.reset()
            state = .signedOut
            self.userInfo = nil
            self.cart = []
        } catch let signOutError as NSError{
            self.errorMessage = signOutError.localizedDescription
            print("Error signing out: \(self.errorMessage)")
        }
    }
    
    // MARK: 유저 기본 정보 패치
    func fetchUserInfo(){
        database.collection("ConsumerAccount").document(userInfo?.userId ?? "")
            .getDocument{(document, error) in
                if let document {
                    let docData = document.data()
                    self.userInfo?.userName = docData?["userName"] as! String
                    self.userInfo?.address = docData?["address"] as! String
                    self.userInfo?.phoneNumber = docData?["phoneNumber"] as! String
                    //self.userInfo?.recentProduct = docData["recentProduct"] as! [String]
                    self.fetchMyDevice()
                }
            }
    }
    
    func fetchMyDevice(){
        database.collection("ConsumerAccount").document(userInfo?.userId ?? "").collection("MyDevice")
            .getDocuments{snapshot, error in
                if let snapshot{
                    var tempDevice: [MyDevice] = []
                    for document in snapshot.documents{
                        let docData = document.data()
                        let deviceId: String = docData["myDeviceId"] as? String ?? ""
                        let deviceName: String = docData["deviceName"] as? String ?? ""
                        let deviceImage: String = docData["deviceImage"] as? String ?? ""
                        let deviceDescription: String = docData["deviceDescription"] as? String ?? ""
                        
                        let myDevice: MyDevice = MyDevice(myDeviceId: deviceId , deviceName: deviceName, deviceImage: deviceImage, deviceDescription: deviceDescription)
                        tempDevice.append(myDevice)
                    }
                   // self.userInfo?.myDevices = tempDevice
                    self.myDevices = tempDevice
                }
            }
    }
    
    func addMyDevice(myDevice: MyDevice){
        database.collection("ConsumerAccount").document(userInfo?.userId ?? "").collection("MyDevice").document(myDevice.myDeviceId)
            .setData([
                "myDeviceId": myDevice.myDeviceId,
                "deviceName": myDevice.deviceName,
                "deviceImage": myDevice.deviceImage,
                "deviceDescription": myDevice.deviceDescription
            ])
        fetchMyDevice()
    }
    
    func removeMyDevice(myDeviceId: String){
        database.collection("ConsumerAccount").document(userInfo?.userId ?? "").collection("MyDevice").document(myDeviceId)
            .delete()
        fetchMyDevice()
    }
    
    // MARK: 유저 장바구니 패치
    
    //    func fetchUserCart(){
    //        database.collection("ConsumerAccount").document(self.userInfo?.userId ?? "").collection("Cart")
    //            .getDocuments{snapshot, error in
    //                if let snapshot{
    //                    var tempCart: [Cart] = []
    //                    for document in snapshot.documents{
    //                        let docData = document.data()
    //
    //                        let productId: String = docData["productId"] as? String ?? ""
    //                        let productName: String = docData["productName"] as? String ?? ""
    //                        let productPrice: Int = docData["productPrice"] as? Int ?? 1000
    //                        let productCount: Int = docData["productCount"] as? Int ?? 1
    //
    //                        let cart: Cart = Cart(productId: productId, productName: productName, productCount: productCount, productPrice: productPrice)
    //
    //                        tempCart.append(cart)
    //                    }
    //                    self.cart = tempCart
    //                }
    //            }
    //    }
}



// 기기에 로그인 정보를 담당하는 구조
extension UserDefaults {
    
    enum Keys: String, CaseIterable {
        
        case email
        case password
        
    }
    
    func reset() {
        Keys.allCases.forEach { removeObject(forKey: $0.rawValue) }
    }
    
}
