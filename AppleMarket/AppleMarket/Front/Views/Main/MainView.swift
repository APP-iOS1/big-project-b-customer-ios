//
//  MainView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(alignment: .leading){
                    
                    MainPromotionView()
                    
                    MainMyProductView()
                    
                    MainProductView()
                    
                }
                .padding()
                .navigationBarTitle("쇼핑하기")
                .toolbar { // <-
                    NavigationLink(
                        destination: MypageView()) {
                            Label("Profile", systemImage: "person.crop.circle")
                        }
                }
            }
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            MainView()
        }
    }
}
