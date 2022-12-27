//
//  MainProductView.swift
//  AppleMarket
//
//  Created by youngseo on 2022/12/27.
//

import SwiftUI

enum Products: String, CaseIterable, Identifiable {
    case Mac
    case iPhone
    case iPad
    case AppleWatch
    case AppleTV4K
    case AirPods
    case AirTag
    case Accessory
    
    var id: String { self.rawValue }
}

struct MainProductView: View {
    private let columns: [GridItem] = .init(repeating: .init(.flexible(), spacing: 10), count: 2)
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("제품별로 쇼핑하기")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(alignment: .leading)
                    .padding(.top, 50)
                
                VStack(alignment: .center){
                    
                    // 신제품
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 360, height: 220)
                    
                    LazyVGrid(columns: columns) {
                        ForEach(Products.allCases) { (product: Products) in
                            NavigationLink {
                                MainProductDetailView(selectedProduct: product)
                                    .navigationTitle(product.rawValue)
                            } label: {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 175, height: 220)
                            }
                            
                        }
                    }
                        
                    }
                }
            }//VStack_End
        }//NavigationStack_End
       
    
}

struct MainProductView_Previews: PreviewProvider {
    static var previews: some View {
        MainProductView()
    }
}
