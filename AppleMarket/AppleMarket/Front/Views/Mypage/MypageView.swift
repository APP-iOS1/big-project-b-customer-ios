//
//  MypageView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct DeviceInform: Hashable {
    let imageName: String
    let deviceName: String
    let deviceModelName: String
}

var myDeviceInform: [DeviceInform] = [
    DeviceInform(
        imageName: "https://www.pngarts.com/files/8/Apple-iPhone-11-PNG-Image-Transparent-Background.png",
        deviceName: "Jero Iphone",
        deviceModelName: "iPhone 11"),
    DeviceInform(
        imageName: "https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/SP858/mbp16-gray.png",
        deviceName: "Jero의 MacBook Pro",
        deviceModelName: "MacBook Pro 16")
]

struct MypageView: View {
    
    @State private var isShowingLoginSheet: Bool = false
    @StateObject var userInfoStore: UserInfoStore
    var body: some View {
        
        
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("마이페이지")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        // 로그인 버튼
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
                    .padding()
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Section {
                            
                            Text("고객님을 위한 제안")
                                .font(.headline)
                            
                            Divider()
                            NavigationLink {
                                EmptyView()
                            } label: {
                                HStack {
                                    Image(systemName: "list.bullet")
                                        .foregroundColor(.pink)
                                        .font(.title2)
                                        .frame(width: 45, height: 45)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .inset(by: 3)
                                                .stroke(.pink, lineWidth: 2)
                                        }
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("주문 관련 실시간 정보를 받아보세요.")
                                            .foregroundColor(.black)
                                            .bold()
                                        Text("주문 내역 및 현황 보러가기")
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
                            Text("")
                                .font(.largeTitle)
                            HStack(alignment: .bottom) {
                                Text("고객님의 기기")
                                    .font(.title)
                                    .bold()
                                Spacer()
                                
                                NavigationLink {
                                    MyDeviceListView()
                                } label: {
                                    Text("모두 보기")
                                }
                            }
                            .padding()
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(alignment: .center, spacing: 0) {
                                    ForEach (myDeviceInform, id: \.self) { device in
                                        
                                        Spacer()
                                        VStack(spacing: 5) {
                                            AsyncImage(url: URL(string: device.imageName)) { image in
                                                
                                                if device.deviceModelName == "iPhone 11" {
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(height: 150)
                                                } else if device.deviceModelName == "MacBook Pro 16" {
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 200, height: 150)
                                                }
                                                
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            
                                            Text(device.deviceName)
                                                .font(.headline)
                                            Text(device.deviceModelName)
                                                .font(.subheadline)
                                            
                                            Text("")
                                                .font(.largeTitle)
                                            NavigationLink {
                                                
                                            } label: {
                                                Text("액세서리 등을 쇼핑하기")
                                                    .font(.subheadline)
                                            }
                                        }
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        
    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MypageView(userInfoStore: UserInfoStore())
                .environmentObject(UserInfoStore())
        }
    }
}
