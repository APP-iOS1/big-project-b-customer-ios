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
                        ForEach(userInfoStore.myDevices, id: \.self) { myDevice in
                            HStack {
                                AsyncImage(url: URL(string: myDevice.deviceImage)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100)
                                } placeholder: {
                                    ProgressView()
                                }

                                Text(myDevice.deviceDescription)
                            }
//                            .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
//                                return 0
//                            }
                        }
                        .onDelete(perform: delete)
                    }
                    
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
                .listStyle(InsetGroupedListStyle())
                
            }
            .navigationBarTitle("내 기기")
            .background(Color("MyPageBGColor"))
            .onAppear {
//                userInfoStore.fetchUserInfo()
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        guard let offsets = offsets.first else { return }
        userInfoStore.removeMyDevice(myDeviceId: userInfoStore.myDevices[offsets].myDeviceId ?? "")
    }
}

struct MyDeviceListView_Previews: PreviewProvider {
    static var previews: some View {
        MyDeviceListView()
    }
}
