//
//  SearchView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct SearchView: View {
    
    @State var transitionView: Bool = false
    @State private var searchInput: String = ""

    var body: some View {
        VStack {
            HStack {
                TextField("\(Image(systemName:"magnifyingglass")) 제품 검색", text: $searchInput)
                    .padding()
                    .frame(height: 36)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(15)
                    .textInputAutocapitalization(.never)
                    .lineLimit(1)
                Button {
                    searchInput.removeAll()
                } label: {
                    Text("취소")
                }
                .padding(.horizontal, 16)
                .accentColor(Color("MainColor"))
            }
            .padding(.bottom, 16)
            
        }
        .padding(16)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
