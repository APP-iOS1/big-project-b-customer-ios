//
//  MyOrderView.swift
//  AppleMarket
//
//  Created by 이소영 on 2022/12/28.
//

import SwiftUI

struct MyOrderView: View {
    @EnvironmentObject var orderStore: OrderStore
    let userId: String = "mUzu710p6zgGOPk64s7D6DhMIq32"

    var body: some View {
        NavigationStack {
            
            List {
                ForEach(orderStore.orderList, id: \.id) { order in
                    NavigationLink(destination: MyOrderDetailView(orderStore: orderStore, userId: userId, order: order)) {
                        OrderListCell(order: order)
                    }
                }
                                   
            }
            .navigationTitle("나의 주문")
            .listStyle(.plain)
            .onAppear{
                orderStore.fetchOrderList(userId: userId)
            }
            
            Spacer()
        }
    }
}

struct OrderListCell:View {
    var order: Order
    var body: some View {
        VStack {
            Button(action: {
                
            }) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(order.orderDate)")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("주문상세")
                            .font(.footnote)
                        Image(systemName: "greaterthan")
                            .padding(.leading, -5)
                            .font(.footnote)
                    }
                    Divider()
                    HStack {
                        AsyncImage(url: URL(string: "\(order.mainProductImage ?? "")")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("\(order.mainProductName ?? "")")
                            HStack {
                                if order.otherProductCount != 0 {
                                    Text("외 \(order.otherProductCount)건")
                                }
                            }
                        }
                        .font(.callout)
                        .padding(.leading, 10)
                        
                        Spacer()
                    }
                }
                .padding(20)
                .frame(width: 330, height: 130)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .foregroundColor(.black)
                
                
                
            }
        }
    }
}

struct MyOrderView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrderView()
            .environmentObject(OrderStore())
    }
}
