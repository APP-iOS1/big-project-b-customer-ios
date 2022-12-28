//
//  SearchProcessView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct SearchProcessView: View {
    //MARK: 이 부부은 승수님과 통합하면서 달라질 부분인 것 같음
    @State private var searchInput: String = ""
    @State private var recents: [String] = [
        "아이폰14",
        "아이폰12"
    ]
    
    var body: some View {
        VStack {
            HStack {
                //이 부분은 승수님 것과 통합될 가능성이 있음
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
                //이 부분은 승수님 것과 통합될 가능성이 있음
                
            }
            .padding(.bottom, 16)
            
            HStack {
                Text("최근결과")
                    .font(.headline)
                
                Spacer()
                
                Button {
                    recents.removeAll()
                    //이 다음 동작은 데이터베이스에 있는 유저의 최근 검색 결과 지우기
                } label: {
                    Text("지우기")
                }
                .accentColor(Color("MainColor"))
                
            }
            List(recents, id: \.self) { recent in
                HStack {
                    Image(systemName:"magnifyingglass")
                        .foregroundColor(.secondary)
                    Text(recent)
                        
                }
            }
            .listStyle(.plain)
            .padding(0)
        }.padding(16)
    }
}

struct SearchProcessView_Previews: PreviewProvider {
    static var previews: some View {
        SearchProcessView()
    }
}
