//
//  EmptyCartView.swift
//  AppleMarket
//
//  Created by hyemi on 2022/12/27.
//

import SwiftUI

struct EmptyCartView: View {
    var body: some View {
        VStack {
            Text("장바구니")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
                .padding()
            
            VStack {
                Image(systemName: "bag")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80)
                    .padding(30)
                
                Text("장바구니에 제품이 없습니다.")
                    .fontWeight(.semibold)
            }
            .foregroundColor(Color(UIColor.systemGray))
            .offset(y: 70)
            
            Spacer()
        }
    }
}

struct EmptyCartView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyCartView()
    }
}
