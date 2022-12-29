//
//  SearchView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI


enum SearchingState {
    case none, finished
}

final class SearchViewModel: ObservableObject {
    @Published var searchResults: [UserProduct] = []
    @Published var recentResults: [String] = []
    @Published var searchInput: String = ""
    @Published var searchingState: SearchingState = .none
    
    func clearResults() {
        self.searchResults.removeAll()
    }
    
    func updateRecentResults() {
        self.recentResults.append(self.searchInput)
    }
    
    func clearRecentResults() {
        self.recentResults.removeAll()
    }
    
    func sortByPrice() -> [UserProduct] {
        let result = self.searchResults.sorted {$0.price < $1.price}
        return result
    }
}

struct SearchView: View {
    @Environment(\.isSearching) var isSearching
    @EnvironmentObject var userProductStore: UserProductStore
    @ObservedObject var viewModel: SearchViewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.searchingState {
            case .none:
                if !viewModel.searchInput.isEmpty {
                    List(viewModel.searchResults) { product in
                        Button {
                            viewModel.searchInput = product.productName
                        } label: {
                            Text(product.productName)
                                .foregroundColor(.black)
                        }
                    }
                    .listStyle(.plain)
                } else {
                    SearchProcessView(viewModel: viewModel)
                }
            case .finished:
                SearchResultView(viewModel: viewModel)
            }
        }
        .searchable(text: $viewModel.searchInput, prompt: "제품 및 매장 검색")
        .onSubmit(of: .search) {
            print("검색완료")
            viewModel.searchingState = .finished
            viewModel.updateRecentResults()
            viewModel.clearResults()
        }
        .onAppear {
            userProductStore.fetchData()
        }
        .onChange(of: viewModel.searchInput) { input in
            viewModel.searchingState = .none

            viewModel.searchResults = userProductStore.userProductStores.filter({ $0.productName.localizedCaseInsensitiveContains(input)})
                
        }
        .transaction { $0.animation = .default.speed(1.3) }
        .navigationTitle("검색")
    }
}



//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
