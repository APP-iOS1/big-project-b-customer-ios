//
//  MyDeviceListView.swift
//  AppleMarket
//
//  Created by Jero on 2022/12/27.
//

import SwiftUI

struct MyDeviceListView: View {
    @State private var isShowingSheet: Bool = false
    @EnvironmentObject var userInfoStore: UserInfoStore
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
//                Text("기기 목록")
//                    .font(.title2)
//                    .bold()
//                Spacer()
               
                List {
                    Section {
                        ForEach(userInfoStore.userInfo?.myDevices ?? [], id: \.self) { myDevice in
                            HStack {
                                AsyncImage(url: URL(string: myDevice.deviceImage)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100)
                                } placeholder: {
                                    Color.gray
                                }

                                Text(myDevice.deviceDescription)
                              
                            }
                            Divider()
//                                .padding(5)
                        }
//                        .frame(height: 55)
                       
                    }
                    .listRowSeparator(.hidden)
                    
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                            Text("기기추가하기")
                                .foregroundColor(.black)
                        }
                    }
                    .frame(height: 40)
                    .sheet(isPresented: $isShowingSheet) {
                        AddMyDeviceView(isShowingSheet: $isShowingSheet)
                            .presentationDetents([.medium,.large])
                    }
                }
                
            }
            .navigationBarTitle("내 기기")
            .background(Color("MyPageBGColor"))
            .onAppear {
                userInfoStore.fetchUserInfo()
            }
        }
        
    }
}

struct MyDeviceListView_Previews: PreviewProvider {
    static var previews: some View {
        MyDeviceListView()
    }
}
