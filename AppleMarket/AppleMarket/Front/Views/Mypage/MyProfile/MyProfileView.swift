//
//  MyProfileView.swift
//  AppleMarket
//
//  Created by Jero on 2022/12/27.
//

import SwiftUI

struct MyProfileView: View {
    let listTitle: [String] = ["내 기기 추가", "주소지 등록"]
    @Binding var isShowingLoginSheet: Bool
    @State private var showingAlertProfile = false
    @State private var isEditName: Bool = false
    @EnvironmentObject var userInfoStore: UserInfoStore
    @State private var action: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                List {
                    Section {
                        HStack {
                           Image(systemName: "person.circle")
                                .font(.largeTitle)
                            
                            VStack(alignment:. leading, spacing: 3) {
                                HStack(alignment: .center) {
                                    Text(userInfoStore.userInfo?.userName ?? "")
                                        .font(.title3)
                                }
                                
                                Text(userInfoStore.userInfo?.userEmail ?? "")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .frame(height: 55)
                    ForEach(listTitle, id: \.self) { title in
                        if title == "내 기기 추가" {
                            NavigationLink {
                                MyDeviceListView()
                            } label: {
                                Text(title)
                            }
                        }                        
//                        else {
//                            NavigationLink {
//                                MyAddressListView()
//                            } label: {
//                                Text(title)
//                            }
//                        }
                    }
                    Section {
                        Button {
                            showingAlertProfile = true
                        } label: {
                            Text("로그아웃")
                                .alert(" ", isPresented: $showingAlertProfile) {
                                    Button("Cancel", role: .cancel) {
                                        
                                    }
                                    
                                    Button("Yes", role: .destructive) {
                                        userInfoStore.emailAuthSignOut()
                                        isShowingLoginSheet.toggle()
                                    }
                                } message: {
                                    Text("로그아웃 하시겠습니까?")
                                }
                        }
                    }
                }
//                .navigationBarTitle("계정")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isShowingLoginSheet = false
                        } label: {
                            Text("닫기")
                        }

                    }
                })
                .navigationBarTitleDisplayMode(.inline)
                
            }
            .onAppear {
                userInfoStore.fetchUserInfo()
            }
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyProfileView(isShowingLoginSheet: .constant(true))
                .environmentObject(UserInfoStore())
        }
        
    }
}
