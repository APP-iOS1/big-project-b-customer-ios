//
//  ContentView.swift
//  AppleMarket
//
//  Created by 진태영 on 2022/12/27.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userInfoStore: UserInfoStore
    
    var body: some View {
        VStack {
            Text("")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onAppear{
            userInfoStore.emailAuthSignIn(email: "123123@gmail.com", password: "123123")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserInfoStore())
    }
}
