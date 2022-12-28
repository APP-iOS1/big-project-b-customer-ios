//
//  MyOrderView.swift
//  AppleMarket
//
//  Created by 이소영 on 2022/12/28.
//

import SwiftUI

struct MyOrderView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("나의 주문")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 30)
                
                
                
                Button(action: {
                    print("주문제품 선택")
                }) {
                    NavigationLink(destination: MyOrderDetailView()) {
                    HStack {
                        VStack {
                            VStack {
                                AsyncImage(url: URL(string: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/airpods-max-select-silver-202011?wid=470&hei=556&fmt=png-alpha&.v=1604021221000")) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150)
                                } placeholder: {
                                    ProgressView()
                                }
                                Text("AirPods Max - 실버")
                                    .padding(.bottom, 15)
                            }
                            .padding(.vertical, 30)
                            
                            Divider()
                            
                            Text("2022년 9월 20일 배송완료")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.vertical, 10)
                                .padding(.bottom, 10)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .foregroundColor(.black)
                        .frame(width: 350)
                    }
                }
                }
            }
        }
    }
}

struct MyOrderView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrderView()
    }
}
