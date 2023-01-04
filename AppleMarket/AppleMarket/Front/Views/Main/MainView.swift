//
//  MainView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI



struct MainView: View {
    @EnvironmentObject var catalogueProductStore: CatalogueProductStore
    @EnvironmentObject var userInfostore: UserInfoStore
    @State private var isShowingSheet: Bool = false
    @State private var isShowingLoginSheet: Bool = false
    var body: some View {
        
                ScrollView{
                    LazyVStack(){
                        
                        MainPromotionView()
                            .frame(width: UIScreen.main.bounds.width - 32 , height: UIScreen.main.bounds.height * 0.15)
                    


                        MainMyProductView(isShowingSheet: $isShowingSheet, isShowingLoginSheet: $isShowingLoginSheet)


                        MainProductView()
                        
                    }
                    .padding(16)
                    .navigationBarTitle("쇼핑하기")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Image("applemarket")
                                .resizable()
                                .frame(width: 60, height: 60)
                        }
                    }
                }
                .onAppear {
                    catalogueProductStore.fetchData()
                    if userInfostore.userInfo != nil {
                        userInfostore.fetchMyDevice()
                    }
                }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            MainView()
                .environmentObject(CatalogueProductStore())
                .environmentObject(UserInfoStore())

        }
    }
}
