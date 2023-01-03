//
//  MainProductDetailView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI

struct MainProduct: Identifiable, Hashable{
    var id: Int
    let imagePath: String
    let productName: String
    var description: String? = nil
    let prices: String
    
    
}


struct MainProductDetailView: View {
    @EnvironmentObject var catalogueProductStore: CatalogueProductStore
    @State private var featuredProducts: [CatalogueProduct] = []
    @State private var categoryProducts: [CatalogueProduct] = []
    let category: String
    
    var body: some View {
        GeometryReader { geo in
            let width: CGFloat = geo.size.width
            let height: CGFloat = geo.size.height
            let itemWidth: CGFloat = width * 0.8
            let itemHeight: CGFloat = height * 0.75

        
            //            if categoryProducts.isEmpty || featuredProducts.isEmpty {
            //                Text("판매중인 상품이 없습니다.")
            //                    .frame(width: width, height: height)
            //            } else {
            ScrollView {
                ScrollView(.horizontal) {
                    Spacer()
                        .frame(height: itemHeight * 0.05)
                    HStack(spacing: 20) {
                        ForEach(featuredProducts) { product in
                            AsyncImage(url: URL(string: product.thumbnailImage)) { Image in
                                ZStack{
                                    Image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: itemWidth, height: itemHeight)
                                        .clipped()
                                        .cornerRadius(30)
                                        .shadow(radius: 10)
                                        .overlay{
                                            RoundedRectangle(cornerRadius: 30)
                                                .fill(LinearGradient(colors: [.black.opacity(0.3), .clear], startPoint: UnitPoint(x:0.5, y: 0), endPoint: UnitPoint(x:0.5, y: 0.5)))
                                        }
                                        .overlay {
                                            HStack {
                                                VStack(alignment: .leading) {
                                                    Text("New")
                                                        .foregroundColor(.orange)
                                                    Text(product.productName)
                                                        .foregroundColor(.white)
                                                        .font(.title)
                                                        .fontWeight(.semibold)
                                                    Text(product.description)
                                                        .foregroundColor(.white)
                                                        .font(.caption)
                                                    Spacer()
                                                    HStack {
                                                        Text("₩\(product.price)부터")
                                                            .font(.caption)
                                                        
                                                        Spacer()
                                                        
                                                        Button {

                                                            
                                                        } label: {
                                                            Text("구입하기")
                                                                .font(.caption)
                                                        }
                                                        .buttonStyle(.bordered)
                                                        
                                                        
                                                    }
                                                    

                                                }
                                                
                                                
                                            }
                                            .frame(width: itemWidth * 0.9, height: itemHeight * 0.9)

                                        }
                                }
                                
                                
                            } placeholder: {
                                Rectangle()
                                    .stroke(lineWidth: 0.1)
                                    .frame(width: itemWidth, height: itemHeight)
                                    .cornerRadius(30)
                                    .overlay {
                                        ProgressView()
                                    }
                            }
                            
                            
                        }
                    }
                    .snapScrolling(itemCount: featuredProducts.count , itemWidth: itemWidth, spacing: 20)
                    Spacer()
                        .frame(height: itemHeight * 0.05)

                }
                .scrollDisabled(true)
                
                Spacer()
                    .frame(height: itemHeight * 0.05)
                
                Divider()
                
                Spacer()
                    .frame(height: itemHeight * 0.1)
                
                LazyVStack {
                    ForEach(categoryProducts) { product in
                        let imageWidth: CGFloat = width / 2.5
                        let imageHeight: CGFloat = height / 6
                        VStack {
                            AsyncImage(url: URL(string: product.thumbnailImage)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: imageWidth, height: imageHeight )
                                    .clipped()
                                    .cornerRadius(10)
                                
                            } placeholder: {
                                ProgressView()
                                    .frame(width: imageWidth, height: imageHeight)
                            }
                            Spacer()
                                .frame(height: 25)
                            Text(product.productName)
                                .font(.headline)
                            Spacer()
                            Text("₩\(product.price)부터")
                                .foregroundColor(Color("MainColor"))

                        }
                        .padding(.vertical, 32)
                        
                        
                    }
                    
                }
            }
//        }
            
            
        }
        .onAppear {
            Task {
                catalogueProductStore.fetchData()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    getCategoryProducts()
                }                
            }
        
            
        }
    }
}

extension MainProductDetailView {
    func getCategoryProducts()  {
        
       
        var filtered : [CatalogueProduct]
        
        if category == "" {
            filtered = catalogueProductStore.catalogueProductStores
        } else {
            filtered = catalogueProductStore.catalogueProductStores.filter({$0.category == self.category})
        }
        
        
        print(filtered)
        
        let filterdCount: Int = filtered.count
        let oneThird: Int = Int(filterdCount/3)
        
        self.featuredProducts = Array(filtered[0..<oneThird])
        self.categoryProducts = Array(filtered[oneThird..<filterdCount])
        
        
    }
}

struct MainProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainProductDetailView(category: "iPad")
    }
}
