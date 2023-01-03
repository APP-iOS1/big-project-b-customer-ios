//
//  AppleMarketApp.swift
//  AppleMarket
//
//  Created by 진태영 on 2022/12/27.
//

import SwiftUI
import FirebaseCore
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct AppleMarketApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var userInfoStore: UserInfoStore = UserInfoStore()
    @StateObject var productStore: ProductStore = ProductStore()
    @StateObject var catalogueProductStore: CatalogueProductStore = CatalogueProductStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userInfoStore)
                .environmentObject(catalogueProductStore)
                .environmentObject(productStore)
        }
    }
}
