//
//  MyDeviceAddView.swift
//  AppleMarket
//
//  Created by Jero on 2022/12/28.
//

import SwiftUI

enum DeviceType: String, CaseIterable, Identifiable {
  case iPhone, iPad, MacBook, iMac
  var id: Self { self }
}

enum iPhoneDevice: String, CaseIterable, Identifiable {
  case iPhone7, iPhone8, iPhone9, iPhone10, iPhone11
  var id: Self { self }
}

enum iPadDevice: String, CaseIterable, Identifiable {
  case iPad, iPadMini, iPadAir, iPadPro
  var id: Self { self }
}

enum MacBookDevice: String, CaseIterable, Identifiable {
  case MacBookAir, MacBookPro
  var id: Self { self }
}

struct AddMyDeviceView: View {
    @State private var selectedDeviceType = DeviceType.iPhone
    @State private var selectedIPhoneDeviceType = iPhoneDevice.iPhone7
    @State private var selectedMacBookDeviceType = MacBookDevice.MacBookAir
    @State private var selectedIPadDeviceType = iPadDevice.iPad
    
    @Binding var isShowingSheet: Bool
    @State private var deviceName: String = ""
    @State private var deviceImage: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("")
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
                    myDeviceInform.append(DeviceInform(imageName: "", deviceName: "Mizy의 \(selectedDeviceType)", deviceModelName: selectedDeviceType.rawValue))
                    print(selectedDeviceType.rawValue)
                    isShowingSheet.toggle()
                } label: {
                    Text("등록하기")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            
            Text("")
            HStack {
                Text("디바이스 선택")
                Picker("iPhone", selection: $selectedDeviceType) {
                    Text("iPhone").tag(DeviceType.iPhone)
                    Text("iPad").tag(DeviceType.iPad)
                    Text("MacBook").tag(DeviceType.MacBook)
                    Text("iMac").tag(DeviceType.iMac)
                }
                
                if selectedDeviceType == .iPhone {
                    Picker("디바이스", selection: $selectedIPhoneDeviceType) {
                        Text("iPhone 7")
                            .tag(iPhoneDevice.iPhone7)
                        Text("iPhone 8")
                            .tag(iPhoneDevice.iPhone8)
                        Text("iPhone 9")
                            .tag(iPhoneDevice.iPhone9)
                        Text("iPhone 10")
                            .tag(iPhoneDevice.iPhone10)
                        Text("iPhone 11")
                            .tag(iPhoneDevice.iPhone11)
                    }
                } else if selectedDeviceType == .iPad {
                    Picker("디바이스", selection: $selectedIPadDeviceType) {
                        Text("iPad")
                            .tag(iPadDevice.iPad)
                        Text("iPad mini")
                            .tag(iPadDevice.iPadMini)
                        Text("iPad Air")
                            .tag(iPadDevice.iPadAir)
                        Text("iPad Pro")
                            .tag(iPadDevice.iPadPro)
                    }
                } else if selectedDeviceType == .MacBook {
                    Picker("디바이스", selection: $selectedMacBookDeviceType) {
                        Text("MacBook Air")
                            .tag(MacBookDevice.MacBookAir)
                        Text("MacBook Pro")
                            .tag(MacBookDevice.MacBookPro)
                    }
                } else if selectedDeviceType == .iMac {
                    
                }
            }
           
            TextField("디바이스 이름을 입력해주세요.", text: $deviceName)
                .font(.title3)
            Spacer()
        }
        .padding()
    }
}

struct MyDeviceAddView_Previews: PreviewProvider {
    @State static var isShowingSheet: Bool = false
    static var previews: some View {
        AddMyDeviceView(isShowingSheet: $isShowingSheet)
    }
}
