//
//  MyDeviceFilterView.swift
//  AppleMarket
//
//  Created by 한승수 on 2022/12/27.
//

import SwiftUI

struct MyDeviceFilterView: View {
    
    @Environment(\.presentationMode) var presentation
    var body: some View {
        NavigationView{
            VStack {
                Text("내 기기 모달 뷰")
            }
            .toolbar {
                Button {
                    
                } label: {
                    Text("취소")
                }
                
            }
        }
    }
    
}

struct MyDeviceFilterView_Previews: PreviewProvider {
    static var previews: some View {
        MyDeviceFilterView()
    }
}
