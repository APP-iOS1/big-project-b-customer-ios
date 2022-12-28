////
////  MainProductDetailView.swift
////  AppleMarket
////
////  Created by Martin on 2022/12/27.
////
//
//import SwiftUI
//
//
//struct MainProductDetailView: View {
//
//    let selectedProduct: Products
//    
//    var body: some View {
//        GeometryReader { geo in
//            let width = geo.size.width
//            let height = geo.size.height
//            
//            ScrollView {
//                ScrollView(.horizontal) {
//                    Spacer()
//                    HStack {
//                        Spacer()
//                            .frame(width: width * 0.05)
//                        ForEach(promotionProducts) { product in
//                            AsyncImage(url: URL(string: product.imagePath)) { Image in
//                                ZStack{
//                                    Image
//                                        .resizable()
//                                        .scaledToFill()
//                                        .frame(width: width * 0.7, height: height * 0.7)
//                                        .padding(.horizontal, 30)
//                                        .clipShape(RoundedRectangle(cornerRadius: 30))
//                                        .shadow(radius: 10)
//                                        .padding(.trailing, 16)
//                                    
//                                    VStack(alignment: .leading) {
//                                        Text("New")
//                                            .foregroundColor(.white)
//                                        Text(product.productName)
//                                            .foregroundColor(.white)
//                                            .font(.title)
//                                            .fontWeight(.semibold)
//                                        Text(product.description ?? "")
//                                            .foregroundColor(.white)
//                                        Spacer()
//                            
//                                    }
//                                    .frame(maxWidth: width * 0.8, alignment: .leading)
////                                    .background(.yellow)
//                                }
//                                        
//                                           
//                            } placeholder: {
//                                ProgressView()
//                            }
//                        }
//                    }
//                    Spacer()
//                }
//                .frame(width: width, height: height * 0.8)
//                
//                Spacer()
//                
//                Divider()
//                
//                LazyVStack {
//                    ForEach(products) { product in
//                        VStack {
//                            AsyncImage(url: URL(string: product.imagePath)) { image in
//                                image
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(height:135)
//                                    
//                            } placeholder: {
//                                ProgressView()
//                            }
//                            Spacer()
//                                .frame(height: 40)
//                            Text(product.productName)
//                                .font(.headline)
//                            Spacer()
//                            Text("₩\(product.prices)부터")
//                                .foregroundColor(Color("MainColor"))
//                        }
//                        .padding(.vertical, 32)
//                        
//                       
//                    }
//                    
//                }
//            }
//        }
//    }
//}
//
//struct MainProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainProductDetailView(selectedProduct: Products.iPad)
//    }
//}
