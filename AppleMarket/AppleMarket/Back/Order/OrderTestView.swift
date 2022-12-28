//
//  OrderTestView.swift
//  AppleMarket
//
//  Created by 홍수만 on 2022/12/27.
//

import SwiftUI

struct OrderTestView: View {
    @StateObject var orderStore: OrderStore = OrderStore()
    let userId: String = "mUzu710p6zgGOPk64s7D6DhMIq32"
    
    var body: some View {
        NavigationStack{
            List(orderStore.orderList) { order in
                NavigationLink {
                    OrderDetailTestView(orderStore: orderStore, order: order, userId: userId)
                } label: {
                    VStack{
                        Text("\(order.orderAddress)")
                        Text("\(order.orderTotalPrice)")
                        
                    }
                }
            }
            .onAppear{
                orderStore.fetchOrderList(userId: userId)
            }
            
            // MARK: - 테스트용 주문목록 데이터 추가
            Button("TestDataAdd") {
                orderStore.addOrder(userId: userId)
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
            
            Text("\(detailOrder.productName)")
            Button {
                async {
                    try? await orderStore.removeOrder(userId: userId, orderId: order.id)
                }
            } label: {
                 Text("remove")
            }
        }
        .onAppear{
            orderStore.fetchDetailOrderList(userId: userId, order: order)
        }
    }
}



struct OrderTestView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTestView()
    }
}