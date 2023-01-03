//
//  SelectedProductView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/28.
//

import SwiftUI

struct DetailButtonView: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Text("장바구니")
                        .foregroundColor(.white)
                        .frame(width:170, height: 55)
                }
                .background(Color("MainColor"))
                .cornerRadius(15)
                
                Button {
                    
                } label: {
                    Text("구매하기")
                        .foregroundColor(.white)
                        .frame(width:170, height: 55)
                }
                .background(Color("MainColor"))
                .cornerRadius(15)
                
            }
        }

    }
}

struct DetailButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailButtonView()
    }
}
