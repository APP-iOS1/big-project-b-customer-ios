//
//  MyDeviceListView.swift
//  AppleMarket
//
//  Created by Jero on 2022/12/27.
//

import SwiftUI

struct MyDeviceListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("기기 목록")
                .font(.title2)
                .bold()
            Spacer()
        }
        .padding()
        .background(Color("myPageBGColor"))
    }
}

struct MyDeviceListView_Previews: PreviewProvider {
    static var previews: some View {
        MyDeviceListView()
    }
}
