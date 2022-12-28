//
//  AddMyAddressView.swift
//  AppleMarket
//
//  Created by Jero on 2022/12/28.
//

import SwiftUI

struct AddMyAddressView: View {
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        VStack {
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
                    isShowingSheet.toggle()
                } label: {
                    Text("등록하기")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            .padding()
            
            ShippingInformation()
            Spacer()
        }
    }
}

struct AddMyAddressView_Previews: PreviewProvider {
    @State static var isShowingSheet: Bool = false
    static var previews: some View {
        AddMyAddressView(isShowingSheet: $isShowingSheet)
    }
}
