//
//  MyDeviceAddView.swift
//  AppleMarket
//
//  Created by Jero on 2022/12/28.
//

import SwiftUI

struct AddMyDeviceView: View {
    @EnvironmentObject var userInfoStore: UserInfoStore
    @StateObject var catalogueProductStore: CatalogueProductStore = CatalogueProductStore()
    
    @Binding var isShowingSheet: Bool
    @State private var selectedProduct: CatalogueProduct? = nil
    @State private var deviceName: String = ""
    @State private var deviceImage: String = ""
    @State private var deviceType: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Button {
                    isShowingSheet.toggle()
                } label: {
                    Text("취소하기")
                        .font(.title3)
                        .foregroundColor(.black)
                }
                
            
                
                Spacer()
                Button {
                    userInfoStore.addMyDevice(myDevice: MyDevice(myDeviceId: UUID().uuidString, deviceName: "", deviceImage: "", deviceDescription: deviceName))
                    isShowingSheet.toggle()
                } label: {
                    Text("등록하기")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            .padding(.top, 20)
            
            ForEach(userInfoStore.userInfo?.myDevices ?? [], id: \.self) { test in
                Text(test.deviceDescription)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(catalogueProductStore.catalogueProductStores) { product in
                        Button(product.category) {
                            
                        }
                    }
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(catalogueProductStore.catalogueProductStores) { product in
                        ForEach(product.device, id: \.self) { deviceItem in
                            Button(deviceItem) {
                                print(deviceItem)
                            }
                        }
                    }
                }
            }
            
            HStack {
                if let selectedProduct {
//                    ForEach(selectedProduct.device, id: \.self) { product in
//                        Button {
//                            deviceType = ""
//                            deviceType = selectedProduct.device + " " + (product ?? "")
//                            print(deviceType)
//                        } label: {
//
//                            Text(product ?? "")
//                        }

                        //                        Button(product!) {
                        //
                        //                        }
//                    }
                }
            }
            
            TextField("디바이스 이름을 입력해주세요.", text: $deviceName)
                .font(.title3)
            Spacer()
        }
        .padding()
        .onAppear {
            catalogueProductStore.fetchData()
            userInfoStore.fetchMyDevice()
        }
    }
}

struct MyDeviceAddView_Previews: PreviewProvider {
    @State static var isShowingSheet: Bool = false
    static var previews: some View {
        AddMyDeviceView(isShowingSheet: $isShowingSheet)
    }
}
