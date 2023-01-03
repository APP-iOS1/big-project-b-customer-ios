//
//  NotLoginMyPageView.swift
//  AppleMarket
//
//  Created by Jero on 2023/01/03.
//

import SwiftUI

struct NotLoginMyPageView: View {
    @State private var isShowingLoginSheet: Bool = false
    @EnvironmentObject var userInfoStore: UserInfoStore
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 15) {
                Section {
                    Text("고객님을 위한 제안")
                        .font(.title3)
                        .bold()
                    Divider()
                    HStack {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .frame(width: 45, height: 45)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 3)
                                    .stroke(.blue, lineWidth: 2)
                            }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("로그인 후 사용하실 수 있습니다.")
                                .foregroundColor(.black)
                                .bold()
                            Text("우측 상단 로그인 버튼으로  로그인해주세요.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }

                }
                Divider()
            }
            .padding()
            
            VStack {
                Section {
                    HStack(alignment: .bottom) {
                        Text("고객님의 기기")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    .padding()
                    Text("로그인하시면 볼 수 있습니다.")
                        .font(.title3)
                        .bold()
                }
            }
            .navigationTitle("마이페이지")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingLoginSheet.toggle()
                        print("로그인 시트 올라옴")
                    } label: {
                        Text(userInfoStore.state == .signedIn ? "내정보" : "로그인")
                    }
                    .sheet(isPresented: $isShowingLoginSheet) {
                        if userInfoStore.state == .signedIn {
                            MyProfileView(isShowingLoginSheet: $isShowingLoginSheet, userInfoStore: userInfoStore)
                            
                        } else {
                            LoginView(isShowingLoginSheet: $isShowingLoginSheet)
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct NotLoginMyPageView_Previews: PreviewProvider {
    static var previews: some View {
        NotLoginMyPageView()
//        NotLoginMyPageView(userInfoStore: UserInfoStore())
//            .environmentObject(UserInfoStore())
    }
}
