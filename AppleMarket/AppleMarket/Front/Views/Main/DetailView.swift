//
//  DetailView.swift
//  AppleMarket
//
//  Created by Martin on 2022/12/27.
//

import SwiftUI


class DetailViewModel: ObservableObject {
    @Published var model: String = ""
    @Published var storage: String = ""
    @Published var color: String = ""
    
}


struct DetailView: View {
    @EnvironmentObject var productStore: ProductStore
    @ObservedObject var detailViewModel = DetailViewModel()
    
    @State var price: Int = 0
    @State var memoryPrice: Int = 0
    
    @State var model: String = "iPhone 14 Pro"
    @State var memory: String = "256GB"
    @State var color: String = "딥 퍼플"
    @State var productArr: [[Product]] = [] // 뷰에 모델 종류 보여지는 순서대로 모델에 해당되는 Product 요소들이 배열로 들어감
    
    
    
    
    
    @State var selectedProduct: CatalogueProduct =
    CatalogueProduct(id: "iPhone 14 Pro", productName: "iPhone 14 Pro", device: ["iPhone 14 Pro"], category: "iPhone", description: "IPhone 14 Pro 입니다.", price: 1550000, thumbnailImage: "", status: 1, descriptionImages: [
        "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-silver?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1663703840488",
        "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-silver_AV1?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1661969351381",
        "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-silver_AV2?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660754259155"], model: ["iPhone 14 Pro", "iPhone 14 Pro Max"], color: ["딥 퍼플", "골드", "실버", "스페이스 블랙"], storage: ["128GB", "256GB", "512GB", "1TB"])
    //    CatalogueProduct(id: "1E74ABFF-19A1-4CC2-9260-2CF80C1B572E", productName: "iPad Air", device: ["iPad Air"], category: "iPad", description: "This is iPad Air", price: 929000, thumbnailImage: "", status: 1, descriptionImages: [
    //        "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-air-finish-unselect-gallery-1-202207?wid=5120&hei=2880&fmt=p-jpg&qlt=95&.v=1654902977555", "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-air-finish-unselect-gallery-2-202207?wid=5120&hei=2880&fmt=p-jpg&qlt=95&.v=1654902978006"], model: ["iPad Air"], color: ["스페이스 그레이", "블루", "핑크", "퍼플", "스타라이트"], storage: ["64GB", "256GB"])
    
    
    var body: some View {
        ScrollView {
            VStack {
                if !productStore.productStore.isEmpty {
                    //                    let _ = searchProduct(catalogueProduct: selectedProduct)
                    //                    let _ = print("productArr : \(productArr[0][0])")
                }
                
                TabView {
                    ForEach(0..<(selectedProduct.descriptionImages?.count ?? 0), id: \.self) { i in
                        AsyncImage(url: URL(string: selectedProduct.descriptionImages?[i] ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                            
                        } placeholder: {
                            // 로딩되기 전까지 대체할 이미지 혹은 스타일
                            ProgressView()
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .frame(height: 230)
                
                Text("\(selectedProduct.productName) 구입하기")
                    .font(.headline)
                    .padding(.vertical, 5)
                Text("₩\(selectedProduct.price)부터")
                
                Divider()
                    .padding(.vertical, 20)
                
                
                if selectedProduct.category == "iPhone" {

                    ModelOptionView(detailViewModel: detailViewModel, selectedProduct: $selectedProduct)
                        .padding(.bottom, 35)
                    ColorOptionView(detailViewModel: detailViewModel,  selectedProduct: $selectedProduct)
                        .padding(.bottom, 50)
                    MemoryOptionView(detailViewModel: detailViewModel,  selectedProduct: $selectedProduct)
                        .padding(.bottom, 35)
                } else if selectedProduct.category == "iPad" {

                    ModelOptionView(detailViewModel: detailViewModel, selectedProduct: $selectedProduct)

                        .padding(.bottom, 35)
                    ColorOptionView(detailViewModel: detailViewModel,  selectedProduct: $selectedProduct)
                        .padding(.bottom, 50)
                    MemoryOptionView(detailViewModel: detailViewModel,  selectedProduct: $selectedProduct)
                        .padding(.bottom, 35)
                }
                
                
                
                VStack {
                    Divider()
                    
                    HStack {
                        AsyncImage(url: URL(string: "https://as-images.apple.com/is/iphone-14-pro-silver-select_AV2?wid=724&hei=488&fmt=p-jpg&qlt=95&.v=1661288383328")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                            
                        } placeholder: {
                            // 로딩되기 전까지 대체할 이미지 혹은 스타일
                            ProgressView()
                        }
                        .frame(width: 150, height: 120)
                        .padding(.trailing, 20)
                        
                        
                        VStack(alignment: .leading) {
                            Text(detailViewModel.model)
                            HStack{
                                Text(detailViewModel.storage)
                                Text(detailViewModel.color)
                            }.padding(.bottom, 20)
                            Text("₩\(selectedProduct.price)")
                                .font(.caption)
                        }
                        Spacer()
                    } // 선택 제품
                    .frame(width: 355)
                    Divider()
                }
                
                DetailButtonView()
                    .padding(.vertical, 20)
                
            }
            
            
        } // ScrollView
        
    } //body
    
}
    



    
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(ProductStore())
    }
}
