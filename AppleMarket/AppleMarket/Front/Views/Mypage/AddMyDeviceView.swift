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
    @State private var selectedProductCategory: String = ""
    @State private var deviceDescription: String = ""
    @State private var deviceImage: String = ""
    @State private var deviceType: String = ""
    
    let deviceCategory: [String] = ["iPhone", "iPad", "MacBook", "iMac", "Apple Watch", "AirPod"]
    let deviceIconName: [String] = ["iphone", "ipad", "laptopcomputer", "desktopcomputer", "applewatch", "airpods.chargingcase"]
    
//    @State private var productCategory: [String] = []
    
    @State private var removeDuplicated: Set<String> = []
    
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
                        myDeviceId: UUID().uuidString,
                        deviceName: "",
                        deviceImage: "",
                        deviceDescription: deviceDescription))
                    isShowingSheet.toggle()
                } label: {
                    Text("등록하기")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            .padding(.top, 20)
            
            // UserStore: UserInfo Device 확인용 코드
            /*
            ForEach(userInfoStore.userInfo?.myDevices ?? [], id: \.self) { test in
                Text(test.deviceDescription)
            }
             */
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack(alignment: .bottom, spacing: 20) {
                    ForEach(0 ..< deviceCategory.count, id: \.self) { index in
                        Button {
                            selectedProductCategory = deviceCategory[index]
                            
                        } label: {
                            VStack(alignment: .center, spacing: 5) {
                                Image(systemName: deviceIconName[index])
                                    .font(.largeTitle)
                                Text(deviceCategory[index])
                            }
                        }
                    }
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(catalogueProductStore.catalogueProductStores) { product in
                        ForEach(product.model ?? [], id: \.self) { deviceModel in
                            let _ = { removeDuplicated.insert(deviceModel) }
                            let _ = print(removeDuplicated)
//                            let _ = print(deviceModel)
                            if removeDuplicated.contains(selectedProductCategory) {
                                Button {
//                                    deviceImage = product.thumbnailImage
//                                    deviceType = deviceModel
                                   
//                                    print("디바이스 이미지는 \(deviceImage), 디바이스 이름은 \(deviceType)" )
//                                    print(product.model?.uniqued()!)
                                } label: {
//                                    Text("테스트")
                                    Text(deviceModel)
                                }
                            }
                        }
                    }
                }
            }
            
            TextField("디바이스 이름을 입력해주세요.", text: $deviceDescription)
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

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

struct MyDeviceAddView_Previews: PreviewProvider {
    @State static var isShowingSheet: Bool = false
    static var previews: some View {
        AddMyDeviceView(isShowingSheet: $isShowingSheet)
    }
}
