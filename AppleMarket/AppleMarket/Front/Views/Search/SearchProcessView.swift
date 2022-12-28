//
//  SearchProcessView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct SearchProcessView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        VStack {
 
            HStack {
                Text("최근결과")
                    .font(.headline)
                
                Spacer()
                
                Button {
                    viewModel.clearRecentResults()
                } label: {
                    Text("지우기")
                }
                .accentColor(Color("MainColor"))
                
            }
            List(viewModel.recentResults, id: \.self) { recent in
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
        SearchProcessView(viewModel: SearchViewModel())
    }
}
