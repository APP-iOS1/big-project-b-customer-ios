//
//  MyDeviceListView.swift
//  AppleMarket
//
//  Created by Jero on 2022/12/27.
//

import SwiftUI

struct MyDeviceListView: View {
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("기기 목록")
                    .font(.title2)
                    .bold()
                Spacer()
                
                List {
                    Section {
                        ForEach(myDeviceInform, id: \.self) { device in
                            AsyncImage(url: URL(string: device.imageName)) { image in
                                HStack(alignment: .center) {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60)
                                    
                                    VStack(alignment: .leading, spacing: 3) {
                                        Text(device.deviceName)
                                            .font(.headline)
                                        Text(device.deviceModelName)
                                            .font(.subheadline)
                                    }
                                }
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        .frame(height: 55)
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
            }
            .padding()
            .background(Color("myPageBGColor"))
        }
        
    }
}

struct MyDeviceListView_Previews: PreviewProvider {
    static var previews: some View {
        MyDeviceListView()
    }
}
