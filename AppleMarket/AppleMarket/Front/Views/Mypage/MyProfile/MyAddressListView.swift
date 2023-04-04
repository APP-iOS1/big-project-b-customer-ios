//
//  MyAddressListView.swift
//  AppleMarket
//
//  Created by Jero on 2022/12/28.
//

import SwiftUI

struct MyAddressListView: View {
    @State private var isShowingSheet: Bool = false
    var myAddress: [String] = ["서울특별시 강북구 수유동 472-691"]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("내 주소 목록")
                    .font(.title2)
                    .bold()
                Spacer()
                
                List {
                    Section {
                        ForEach(myAddress, id: \.self) { address in
                            Text(address)
                        }
                        .frame(height: 55)
                    }
                    
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                            Text("주소지 등록하기")
                                .foregroundColor(.black)
                        }
                    }
                    .frame(height: 40)
                    .fullScreenCover(isPresented: $isShowingSheet, content: {
                        AddMyAddressView(isShowingSheet: $isShowingSheet, receiverName: "", contactNumber: "", address1: "", address2: "", address3: "", address4: "")
                    })
                }
            }
            .padding()
            .background(Color("MyPageBGColor"))
        }
        
    }
}

struct MyAddressListView_Previews: PreviewProvider {
    static var previews: some View {
        MyAddressListView()
    }
}
