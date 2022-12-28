//
//  UserProductTestView.swift
//  AppleMarket
//
//  Created by 홍진표 on 2022/12/28.
//

import SwiftUI

struct UserProductTestView: View {
    
    @StateObject var userProductStore: UserProductStore = UserProductStore()
    
    var body: some View {
        List {
            ForEach(userProductStore.userProductStores) { element in
                Text("\(element.count)")
            }
        }
        .onAppear {
            userProductStore.fetchData()
        }
    }
}

struct UserProductTestView_Previews: PreviewProvider {
    static var previews: some View {
        UserProductTestView()
    }
}
