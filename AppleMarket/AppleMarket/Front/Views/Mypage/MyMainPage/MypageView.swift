//
//  MypageView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct MypageView: View {
    @State private var isShowingLoginSheet: Bool = false
    @EnvironmentObject var userInfoStore: UserInfoStore
    var body: some View {
        VStack {
            if userInfoStore.state == .signedOut {
                NotLoginMyPageView()
            } else {
                LoginMyPageView()
            }
        }
    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MypageView()
        }
    }
}
