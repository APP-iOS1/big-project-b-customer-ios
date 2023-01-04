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
            // 로그인 상태에 따라 마이페이지 뷰를 다르게 그림
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
