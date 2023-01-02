//
//  DetailOptionView.swift
//  AppleMarket
//
//  Created by 이지연 on 2022/12/27.
//

import SwiftUI

struct ModelOptionView: View {
    @State private var isChecking = [false, false]
    @Binding var model: String
    @Binding var selectedProduct: CatalogueProduct
//    = CatalogueProduct(id: "1A20CDEF-F296-444B-903C-4CD5C3A4A471", productName: "iPhone 14 Pro", device: ["iPhone 14 Pro"], category: "iPhone", description: "IPhone 14 Pro 입니다.", price: 1550000, thumbnailImage: "", status: 1, descriptionImages: [
//        "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-silver?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1663703840488",
//        "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-silver_AV1?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1661969351381",
//        "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-silver_AV2?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660754259155"], model: ["iPhone 14 Pro", "iPhone 14 Pro Max"])
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("모델.")
                    .bold()
                Text("당신에게 딱 맞는 모델은?")
            }
            .padding(.bottom, 10)
            
            Button {
                isChecking = [true, false]
                model = selectedProduct.model?[0] ?? ""
            } label: {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(selectedProduct.model?[0] ?? "")
                        Text("15.5cm 디스플레이")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("₩\(selectedProduct.price)부터")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .foregroundColor(.black)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(isChecking[0] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
            }

            Button {
                isChecking = [false, true]
                model = selectedProduct.model?[1] ?? ""
            } label: {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(selectedProduct.model?[1] ?? "")
                        Text("17.0cm 디스플레이")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("₩1,750,000부터")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .foregroundColor(.black)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(isChecking[1] ? Color("MainColor") : Color.gray, lineWidth: 1.5))
            }

        }
        .padding()
    }
}

//struct ModelOptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModelOptionView()
//    }
//}
