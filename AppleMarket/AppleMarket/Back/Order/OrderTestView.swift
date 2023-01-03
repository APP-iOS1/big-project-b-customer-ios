//
//  OrderTestView.swift
//  AppleMarket
//
//  Created by 홍수만 on 2022/12/27.
//

import SwiftUI

struct OrderTestView: View {
    @EnvironmentObject var orderStore: OrderStore
    
    // MARK: - test용 data
    let products: [Product] = [Product(id: "testID",
                                       category: "iPhone",
                                       color: "silver",
                                       description: "test description",
                                       device: "iPhone_14_ProMax",
                                       image: ["https://www.apple.com/newsroom/images/product/mac/standard/Apple-Mac-Studio-Studio-Display-hero-220308_big.jpg.slideshow-xlarge_2x.jpg", "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-model-unselect-gallery-1-202209?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660753619946"],
                                       price: 10000,
                                       productName: "iPhone14ProMax",
                                       status: 0,
                                       storage: 256,
                                       productCount: 1),
                               Product(id: "testID",
                                       category: "iPhone",
                                       color: "silver",
                                       description: "test description",
                                       device: "iPhone_14_ProMax",
                                       image: ["https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-14-pro-model-unselect-gallery-1-202209?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660753619946",
                                            "https://www.apple.com/newsroom/images/product/mac/standard/Apple-Mac-Studio-Studio-Display-hero-220308_big.jpg.slideshow-xlarge_2x.jpg"],
                                       price: 10000, productName: "iPhone14ProMax",
                                       status: 0,
                                       storage: 256,
                                       productCount: 2)]
    
    let orderInfo: Order = Order(orderName: "주문자이름", orderPhone: "010-1111-2222", orderAddress: "주문주소")
    let userInfo = UserInfo(userId: "mUzu710p6zgGOPk64s7D6DhMIq32", userName: "홍길동", userEmail: "123123@gmail.com", address: "송파구", phoneNumber: "010-1234-5678")
    
    var body: some View {
        NavigationStack{
            // MARK: - 테스트용 주문목록 데이터 추가
            Button("TestDataAdd") {
                orderStore.addOrder(user: userInfo, products: products, orderInfo: orderInfo)
            }
            
            List(orderStore.orderList) { order in
                NavigationLink {
                    OrderDetailTestView(orderStore: orderStore, order: order, userId: userInfo.userId)
                } label: {
                    VStack{
                        HStack {
                            Text("\(order.orderDate)")
                            Spacer()
                        }
                            
                        HStack {
                            AsyncImage(url: URL(string: order.mainProductImage ?? "")) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            } placeholder: {
                                ProgressView()
                            }
                            VStack {
                                Text("\(order.mainProductName ?? "")")
                                Text(" 외 \(order.otherProductCount)건")
                            }
                            Spacer()
                        }
                    }
                }
            }
            .onAppear{
                orderStore.fetchOrderList(userId: userInfo.userId)
            }
            
        }
    }
}

struct OrderDetailTestView: View {
    @ObservedObject var orderStore: OrderStore
    
    var order: Order
    let userId: String
    
    var body: some View{
        List(orderStore.detailOrderList) { detailOrder in
            
            Text("\(order.orderDate)")
        }
        .onAppear{
            orderStore.fetchDetailOrderList(userId: userId, order: order)
        }
    }
}

//            Button {
//                async {
//                    try? await orderStore.removeOrder(userId: userId, orderId: order.id)
//                }
//            } label: {
//                 Text("remove")
//            }


struct OrderTestView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTestView()
            .environmentObject(OrderStore())
    }
}
