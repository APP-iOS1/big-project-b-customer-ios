//
//  MainProductView.swift
//  AppleMarket
//
//  Created by youngseo on 2022/12/27.
//

import SwiftUI

let tempImgPaths: [String] = [
    "https://www.apple.com/newsroom/images/product/mac/standard/Apple-Mac-Studio-Studio-Display-hero-220308_big.jpg.slideshow-xlarge_2x.jpg",
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-iphone-12-purple-2021?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1635202738000",
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-ipad-pro-11-wifi-silver-2019_AV1?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1581985474458",
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MKYP3ref_VW_34FR+watch-45-alum-silver-nc-8s_VW_34FR_WF_CO?wid=1400&hei=1400&trim=1%2C0&fmt=p-jpg&qlt=95&.v=1630364852000%2C1661969952538",
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/apple-tv-4k-hero-select-202210_FMT_WHH?wid=640&hei=600&fmt=jpeg&qlt=90&.v=1664896361164",
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MME73?wid=2000&hei=2000&fmt=jpeg&qlt=95&.v=1632861342000",
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airtag-double-select-202104_FMT_WHH?wid=2000&hei=2000&fmt=jpeg&qlt=90&.v=1617761672000",
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-magsafe-header-accessories-202209_FMT_WHH?wid=1472&hei=880&fmt=jpeg&qlt=90&.v=1666046556146"
]

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
    
    var index: Int {
        switch self {
        case .Mac: return 0
        case .iPhone: return 1
        case .iPad: return 2
        case .AppleWatch: return 3
        case .AppleTV4K: return 4
        case .AirPods: return 5
        case .AirTag: return 6
        case .Accessory: return 7
        }
    }
}

struct MainProductView: View {
    private let columns: [GridItem] = .init(repeating: .init(.flexible(), spacing: 10), count: 2)
    
    var body: some View {
        NavigationStack {
            
                VStack(alignment: .center){
                    
                    // 신제품
//                    RoundedRectangle(cornerRadius: 20)
//                        .frame(width: 360, height: 220)
//                        .foregroundColor(.white)
//                        .shadow(radius: 5)
//                        .frame(width: 165, height: 240)
                    
                    NavigationLink {
                        MainProductDetailView(category: "")
                            .navigationTitle("신제품")
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 360, height: 220)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .overlay{
                                VStack {
                                    HStack{
                                        Text("신제품")
                                            .foregroundColor(.black)
                                            .font(.headline)
                                            .padding(.horizontal, 16)
                                            .padding(.top, 24)
                                        Spacer()
                                    }
                                    .frame(width: 360)
                                    .padding(.bottom, 32)
                                
                                    
                                    AsyncImage(url: URL(string: tempImgPaths.randomElement()!)) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 160)
                                    } placeholder: {
                                        ProgressView()
                                }
                                    Spacer()
                                }

                            }
                    }
                    
                    LazyVGrid(columns: columns) {
                        ForEach(Products.allCases) { (product: Products) in
                            NavigationLink {
                                MainProductDetailView(category: product.rawValue)
                                    .navigationTitle(product.rawValue)
                                    .navigationBarTitleDisplayMode(.inline)
                            } label: {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 165, height: 220)
                                    .foregroundColor(.white)
                                    .shadow(radius: 5)
                                    .frame(width: 165, height: 240)
                                    .overlay{
                                        VStack {
                                            HStack{
                                                Text(product.rawValue)
                                                    .foregroundColor(.black)
                                                    .font(.headline)
                                                Spacer()
                                            }
                                            .padding(.horizontal, 16)
                                            .padding(.top, 24)
                                            .padding(.bottom, 32)
                                        
                                            
                                            AsyncImage(url: URL(string: tempImgPaths[product.index])) { image in
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 120)
                                            } placeholder: {
                                                ProgressView()
                                        }
                                            Spacer()
                                        }

                                    }
                            }
                            
                        }
                    }
//                    .padding(.horizontal, 20)
                    }
                
            //VStack_End
            }//NavigationStack_End
        }
       
    
}

struct MainProductView_Previews: PreviewProvider {
    static var previews: some View {
        MainProductView()
    }
}
