//
//  MypageView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

//struct DeviceInform: Hashable {
//    let imageName: String
//    let deviceName: String
//    let deviceModelName: String
//}
//
//var myDeviceInform: [DeviceInform] = [
//    DeviceInform(
//        imageName: "https://www.pngarts.com/files/8/Apple-iPhone-11-PNG-Image-Transparent-Background.png",
//        deviceName: "Jero Iphone",
//        deviceModelName: "iPhone 11"),
//    DeviceInform(
//        imageName: "https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/SP858/mbp16-gray.png",
//        deviceName: "Jero의 MacBook Pro",
//        deviceModelName: "MacBook Pro 16")
//]

struct MypageView: View {
    
    @State private var isShowingLoginSheet: Bool = false
    @StateObject var userInfoStore: UserInfoStore
    var body: some View {
        VStack {
            if userInfoStore.state == .signedOut {
                notLoginPageView
            } else {
                loginPageView
            }
        }
    }
    
    var notLoginPageView: some View {
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
    
    var loginPageView: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 15) {
                    Section {
                        Text("")
                        Text("고객님을 위한 제안")
                            .font(.title3)
                            .bold()
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
                                    Text((userInfoStore.state == .signedIn) ? "주문 관련 실시간 정보를 받아보세요." : "로그인 후 사용하실 수 있습니다.")
                                        .foregroundColor(.black)
                                        .bold()
                                    Text((userInfoStore.state == .signedIn) ? "주문 내역 및 현황 보러가기" : "우측 상단 로그인 버튼으로  로그인해주세요.")
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
                                .font(.title3)
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
                            HStack(alignment: .center, spacing: 15) {
                                ForEach(userInfoStore.userInfo?.myDevices ?? [], id: \.self) { myDevice in
                                    VStack(spacing: 15) {
                                            AsyncImage(url: URL(string: myDevice.deviceImage)) { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 300)
                                            } placeholder: {
                                                Color.gray
//                                                ProgressView()
                                            }
                                            Text(myDevice.deviceDescription)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                if userInfoStore.state == .signedIn {
                    userInfoStore.fetchMyDevice()
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
