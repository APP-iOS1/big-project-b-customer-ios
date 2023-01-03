//
//  MainView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI



struct MainView: View {
    @EnvironmentObject var caltalogueProductStore: CatalogueProductStore
    @EnvironmentObject var userInfostore: UserInfoStore
    @State private var isShowingSheet: Bool = false
    @State private var isShowingLoginSheet: Bool = false
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(alignment: .leading){
                    
                    MainPromotionView()
                    

                    MainMyProductView(isShowingSheet: $isShowingSheet, isShowingLoginSheet: $isShowingLoginSheet)

                    
                    Text("제품별로 쇼핑하기")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                        .padding(.top, 50)
                    
                    MainProductView()
                    
                }
                .padding()
                .navigationBarTitle("쇼핑하기")
            }
        }
        .onAppear{
            caltalogueProductStore.fetchData()
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
