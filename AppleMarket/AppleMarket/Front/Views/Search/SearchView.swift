//
//  SearchView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct SearchView: View {
    
    @State private var transitionView: Bool = false
    @State private var searchInput: String = ""
    @State private var hasResult: Bool = false
    
    @Environment(\.isSearching) var isSearching

    var body: some View {
        VStack {
            SearchContent(searchInput: searchInput, hasResult: $hasResult)
        }
        .searchable(text: $searchInput, prompt: "제품 및 매장 검색")
        .onSubmit(of: .search) {
            print("서치버튼 클릭")
            hasResult = true
        }
        .navigationTitle("검색")
    }
}

struct SearchContent: View {
    var searchInput: String
    @Binding var hasResult: Bool
    
    @Environment(\.isSearching) var isSearching
    @Environment(\.dismissSearch) var dismissSearch // 1
    
    var body: some View {
        VStack {
            Text(searchInput)
            if isSearching {
                HStack {
                    Text("최근결과")
                        .font(.headline)
                    
                    Spacer()
                    
//                    Button {
//                        recents.removeAll()
//                        //이 다음 동작은 데이터베이스에 있는 유저의 최근 검색 결과 지우기
//                    } label: {
//                        Text("지우기")
//                    }
//                    .accentColor(Color("MainColor"))
                    
                }
//                List(recents, id: \.self) { recent in
//                    HStack {
//                        Image(systemName:"magnifyingglass")
//                            .foregroundColor(.secondary)
//                        Text(recent)
//
//                    }
//                }
//                .listStyle(.plain)
//                .padding(0)
            } else {
                if hasResult {
                    SearchResultView()
                } else {
                    Text("검색어 입력중")
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
