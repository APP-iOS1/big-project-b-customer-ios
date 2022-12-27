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
                
                VStack(alignment: .center){
                    
                    // 신제품
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 360, height: 220)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .frame(width: 165, height: 240)
                    
                    LazyVGrid(columns: columns) {
                        ForEach(Products.allCases) { (product: Products) in
                            NavigationLink {
                                MainProductDetailView(selectedProduct: product)
                                    .navigationTitle(product.rawValue)
                            } label: {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 165, height: 220)
                                    .foregroundColor(.white)
                                    .shadow(radius: 5)
                                    .frame(width: 165, height: 240)
                            }
                            
                        }
                    }
//                    .padding(.horizontal, 20)
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
