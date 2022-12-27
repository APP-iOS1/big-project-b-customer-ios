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
    @Published var cart: [Cart] = []
    @Published var orderList: [OrderList] = []
    
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
                self.userInfo?.userId = user.uid
                self.userInfo?.userEmail = user.email ?? ""
                
                // 앱실행 할 때 기기에 저장되어있는 로그인, 비밀번호 기록으로 자동 로그인이 되도록 하는 값을 저장함
                // 기기 core저장소에 email 키에 email 값을 저장
                UserDefaults.standard.set(email, forKey: UserDefaults.Keys.email.rawValue)
                // 기기 core저장소에 password 키에 password 값을 저장
                UserDefaults.standard.set(password, forKey: UserDefaults.Keys.password.rawValue)
                self.state = .signedIn
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
                
            }
        }
    }
    
    func firebaseSignUp(userId: String, userName: String, userEmail: String, address: String, phoneNumber: String, myDevices: [MyDevice]){
        database.collection("/User/Consumer/ConsumerId/")
    }
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
