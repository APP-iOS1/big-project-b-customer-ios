//
//  LoginMyPageView.swift
//  AppleMarket
//
//  Created by Jero on 2023/01/03.
//

import SwiftUI

// 로그인이 되었을 때 MyPageView
struct LoginMyPageView: View {
    @State private var isShowingLoginSheet: Bool = false
    @EnvironmentObject var userInfoStore: UserInfoStore
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 15) {
                    Section {
                        Text("고객님을 위한 제안")
                            .font(.title3)
                            .bold()
                            .padding(.top, 15)
                        Divider()
                        NavigationLink {
                            MyOrderView()
                        } label: {
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
                                    Text("주문 관련 실시간 정보를 받아보세요.")
                                        .foregroundColor(.black)
                                        .bold()
                                    Text("주문 내역 및 현황 보러가기" )
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
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
                                .padding(.top, 15)
                            Spacer()
                            
                            NavigationLink {
                                MyDeviceListView()
                            } label: {
                                Text("모두 보기")
                            }
                        }
                        .padding()
                        
                        ScrollView(.horizontal) {
                            HStack(alignment: .center) {
                                if userInfoStore.myDevices.count < 1 {
                                    Text("내 기기를 추가해주세요.")
                                        .padding()
                                } else {
                                    ForEach(userInfoStore.myDevices, id: \.self) { myDevice in
                                        VStack(spacing: 15) {
                                            AsyncImage(url: URL(string: myDevice.deviceImage)) { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 300)
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            Text(myDevice.deviceDescription)
                                                .bold()
                                            Text(myDevice.deviceName)
                                            
                                        }
                                        
                                    }
                                    
                                }
                            }
                            .snapScrolling(itemCount: userInfoStore.myDevices.count, itemWidth: 300, spacing: 10)
                        }
                        .scrollDisabled(true)
                    }
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
                            MyProfileView(isShowingLoginSheet: $isShowingLoginSheet)
                            
                        } else {
                            LoginView(isShowingLoginSheet: $isShowingLoginSheet)
                        }
                    }
                }
            }
        }
    }
}

struct LoginMyPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginMyPageView()
    }
}
