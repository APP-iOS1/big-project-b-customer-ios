//
//  CartSignInView.swift
//  AppleMarket
//
//  Created by hyemi on 2022/12/27.
//

import SwiftUI

struct CartSignOutView: View {
    @State private var isShowingLoginSheet: Bool = false
    @EnvironmentObject var userInfoStore: UserInfoStore
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            Text("장바구니")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("저장된 제품이 있는지 확인하려면 로그인하십시오.")
                .fontWeight(.semibold)
            
            Button(action: {
                isShowingLoginSheet.toggle()
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("MainColor"))
                        .frame(maxWidth: .infinity, maxHeight: 55, alignment: .center)
                    Text("로그인")
                        .foregroundColor(.white)
                }
            }
            .sheet(isPresented: $isShowingLoginSheet) {
                if userInfoStore.state == .signedIn {
                    MyProfileView(isShowingLoginSheet: $isShowingLoginSheet)
                } else {
                    LoginView(isShowingLoginSheet: $isShowingLoginSheet)
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct CartSignOutView_Previews: PreviewProvider {
    static var previews: some View {
        CartSignOutView()
    }
}
