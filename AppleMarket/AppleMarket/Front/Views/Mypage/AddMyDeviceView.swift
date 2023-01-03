//
//  MyDeviceAddView.swift
//  AppleMarket
//
//  Created by Jero on 2022/12/28.
//

import SwiftUI

struct DeviceCategory {
    let deviceCategory: String
    let deviceIconName: String
}

struct DeviceInform: Hashable {
    let deviceImageName: String
    let deviceType: String
}

struct AddMyDeviceView: View {
    @EnvironmentObject var userInfoStore: UserInfoStore
    @EnvironmentObject var catalogueProductStore: CatalogueProductStore
    @Binding var isShowingSheet: Bool
    @State private var selectedProductCategory: String = ""
    @State private var deviceDescription: String = ""
    @State private var deviceImage: String = ""
    @State private var deviceType: String = ""
    
    let categoryDevice: [DeviceCategory] = [
        DeviceCategory(deviceCategory: "iPhone", deviceIconName: "iphone"),
        DeviceCategory(deviceCategory: "iPad", deviceIconName: "ipad"),
        DeviceCategory(deviceCategory: "MacBook", deviceIconName: "laptopcomputer"),
        DeviceCategory(deviceCategory: "iMac", deviceIconName: "desktopcomputer"),
        DeviceCategory(deviceCategory: "Apple Watch", deviceIconName: "applewatch"),
        DeviceCategory(deviceCategory: "AirPod", deviceIconName: "airpods.chargingcase"),
    ]
    
    @State private var removeDuplicated = [String]()
    @State private var notDuplicatedDeviceInform = [DeviceInform]()
    
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
                    let deviceId = UUID().uuidString
                    userInfoStore.addMyDevice(myDevice: MyDevice(
                        myDeviceId: deviceId,
                        deviceName: deviceType,
                        deviceImage: deviceImage,
                        deviceDescription:
                            (deviceDescription == "") ? "\(userInfoStore.userInfo!.userName)의 \(selectedProductCategory)" : "\(deviceDescription)"))
                    isShowingSheet.toggle()
                } label: {
                    Text("등록하기")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            .padding(.top, 20)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack(alignment: .bottom, spacing: 20) {
                    ForEach(0 ..< categoryDevice.count, id: \.self) { index in
                        Button {
                            selectedProductCategory = categoryDevice[index].deviceCategory
                            for product in catalogueProductStore.catalogueProductStores{
                                if let modelArr = product.model{
                                    for deviceModel in modelArr{
                                        if !removeDuplicated.contains(deviceModel){
                                            removeDuplicated.append(deviceModel)
                                            notDuplicatedDeviceInform.append(DeviceInform(deviceImageName: product.thumbnailImage, deviceType: deviceModel))
                                            deviceImage = product.thumbnailImage
                                        }
                                    }
                                }
                            }
                        } label: {
                            VStack(alignment: .center, spacing: 5) {
                                Image(systemName: categoryDevice[index].deviceIconName)
                                    .font(.largeTitle)
                                Text(categoryDevice[index].deviceCategory)
                            }
                        }
                    }
                }
            }
            .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(notDuplicatedDeviceInform, id: \.self) { device in
                        if device.deviceType.contains(selectedProductCategory) {
                            Button {
                                deviceImage = device.deviceImageName
                                deviceType = device.deviceType
                                print("디바이스 이미지는 \(deviceImage), 디바이스 이름은 \(deviceType)")
                            } label: {
                                Text(device.deviceType)
                            }
                            .padding(10)
                            .border(.black, width: 1)
                        }
                        
                    }
                }
            }
            .padding(.top, 10)
            
            TextField("닉네임을 설정해주세요. 예)슾Hyem", text: $deviceDescription)
                .font(.title3)
            Spacer()
        }
        .foregroundColor(.black)
        .padding()
        .onAppear {
            catalogueProductStore.fetchData()
            userInfoStore.fetchUserInfo()
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
