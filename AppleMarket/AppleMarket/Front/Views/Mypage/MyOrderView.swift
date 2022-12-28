//
//  MyOrderView.swift
//  AppleMarket
//
//  Created by 이소영 on 2022/12/28.
//

import SwiftUI

struct MyOrderView: View {
    @State var orderHistory = [
        OrderHistory(orderedDate: "2022년 9월 7일", orderedProductImage: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/airpods-max-select-silver-202011?wid=470&hei=556&fmt=png-alpha&.v=1604021221000", orderedProductName: "AirPods Max - 실버", orderedCount: "3"),
        OrderHistory(orderedDate: "2022년 6월 1일", orderedProductImage: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/airpods-max-select-silver-202011?wid=470&hei=556&fmt=png-alpha&.v=1604021221000", orderedProductName: "AirPods Max - 핑크", orderedCount: "5"),
        OrderHistory(orderedDate: "2021년 12월 30일", orderedProductImage: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/airpods-max-select-silver-202011?wid=470&hei=556&fmt=png-alpha&.v=1604021221000", orderedProductName: "AirPods Max - 블랙", orderedCount: "1")
    ]
    
    var body: some View {
        NavigationStack {

          
                List {
                    ForEach(orderHistory, id: \.self) { index in
                        NavigationLink(destination: MyOrderDetailView()) {
                            OrderListCell(orderHistory: index)
                        }
                    }
                }
                .navigationTitle("나의 주문")
                .listStyle(.plain)

            Spacer()
            
        }
    }
}


struct OrderHistory: Hashable {
    var id = UUID()
    var orderedDate: String
    var orderedProductImage: String
    var orderedProductName: String
    var orderedCount: String
}

struct OrderListCell:View {
    var orderHistory: OrderHistory
    var body: some View {
        VStack {
            Button(action: {
                
            }) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(orderHistory.orderedDate)")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("주문상세 >")
                            .font(.callout)
                    }
                    Divider()
                    HStack {
                        AsyncImage(url: URL(string: "\(orderHistory.orderedProductImage)")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("\(orderHistory.orderedProductName)")
                            HStack {
                                Text("외 2건")
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
    }
}
