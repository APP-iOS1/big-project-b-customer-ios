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
                    
                    Text("제품별로 쇼핑하기")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                        .padding(.top, 50)
                    
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
