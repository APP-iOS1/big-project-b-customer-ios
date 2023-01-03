//
//  MyOrderDetailView.swift
//  AppleMarket
//
//  Created by 이소영 on 2022/12/28.
//

import SwiftUI

struct MyOrderDetailView: View {
    @ObservedObject var orderStore: OrderStore
    
    let userId: String
    var order: Order
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("주문 상세 정보")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                Text("주문번호 : \(order.id ?? "")")
                    .font(.callout)
                Text("주문접수 : \(order.orderDate)")
                    .font(.callout)
                
                List {
                    ForEach(orderStore.detailOrderList, id: \.id) { detailOrder in
                        OrderListCell2(detailOrder: detailOrder)
                    }
                }
                .navigationTitle("주문 상세 정보")
                .listStyle(.plain)
                .onAppear {
                    orderStore.fetchDetailOrderList(userId: userId, order: order)
                }
                
                Divider()
                    .padding(.vertical, 10)
                
                // 배송, 결제요약
                VStack(alignment: .leading) {
                    Group {
                        Text("배송 요약")
                            .font(.title3)
                            .padding(.bottom, 10)
                            .fontWeight(.bold)
                        Text("\(order.id ?? "")")
                        Text("010-1234-5678")
                        Text("\(order.orderAddress)")
                            .padding(.bottom, 30)
                    }
                    .padding(.bottom, -1)
                    
                    Group {
                        Text("결제 요약")
                            .font(.title3)
                            .padding(.bottom, 10)
                            .fontWeight(.bold)
                        Text("결제 수단: 무통장 입금")
                            .padding(.bottom, 30)
                    }
                    .padding(.bottom, -1)
                    
                    // 총계
                    Group {
                        VStack(alignment: .leading) {
                            
                            HStack {
                                Text("소계")
                                Spacer()
                                Text("₩ \(order.orderTotalPrice ?? 0)")
                            }
                            .padding(.bottom, 5)
                            HStack {
                                Text("배송")
                                Spacer()
                                Text("무료")
                            }
                            .padding(.bottom, 10)
                            
                            Divider()
                            HStack {
                                Text("총계")
                                    .font(.title3)
                                    .padding(.bottom, 10)
                                    .fontWeight(.bold)
                                Spacer()
                                Text("₩ \(order.orderTotalPrice ?? 0)")
                                    .font(.title3)
                                    .padding(.bottom, 10)
                                    .fontWeight(.bold)
                            }
                            .padding(.vertical, 10)
                        }
                    }
                }
            }
            .padding(25)
        }
    }
}



struct OrderListCell2: View {
    
    var detailOrder: DetailOrder
    
    var body: some View {
        
        HStack {
            AsyncImage(url: URL(string: "\(detailOrder.productImage)")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text("\(detailOrder.productName)")
                HStack {
                    Text("₩ \(detailOrder.productPrice)")
                        .bold()
                    Text("\(detailOrder.productCount) 개")
                        .padding(.leading, 10)
                }
            }
            .font(.callout)
            .padding(.leading, 10)
            
            Spacer()
        }
        .padding(.bottom, 10)

    }
}


//
//struct MyOrderDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyOrderDetailView(orderStore: OrderStore(), userId: "mUzu710p6zgGOPk64s7D6DhMIq32", order: Order(id: String, orderAddress: String, orderTotalPrice: Int, isDeposit: Bool, orderAt: Date, detailOrderCount: Int, mainProductImage: String, mainProductName: String))
//    }
//}
