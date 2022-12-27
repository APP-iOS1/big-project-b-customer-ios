//
//  ContentView.swift
//  AppleMarket
//
//  Created by 진태영 on 2022/12/27.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: Int = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            MainView()
                .tabItem {
                    Image(systemName: "macbook.and.iphone")
                    Text("쇼핑하기")
                }
                .tag(1)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
                .tag(2)
            
            CartView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("장바구니")
                }
                .tag(3)
            
            LoginView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("마이페이지")
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
