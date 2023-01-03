//
//  AddMyAddressView.swift
//  AppleMarket
//
//  Created by Jero on 2022/12/28.
//

import SwiftUI

struct AddMyAddressView: View {
    @Binding var isShowingSheet: Bool
    
    @State var receiverName: String
    @State var contactNumber: String
    @State var address1: String
    @State var address2: String
    @State var address3: String
    @State var address4: String
    
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
            
            ShippingInformation(receiverName: $receiverName, contactNumber: $contactNumber, address1: $address1, address2: $address2, address3: $address3, address4: $address4)
            Spacer()
        }
    }
}

struct AddMyAddressView_Previews: PreviewProvider {
    @State static var isShowingSheet: Bool = false
    static var previews: some View {
      //  AddMyAddressView(isShowingSheet: $isShowingSheet)
        AddMyAddressView(isShowingSheet: $isShowingSheet, receiverName: "", contactNumber: "", address1: "", address2: "", address3: "", address4: "")

    }
}
