//
//  MyOrderDetailView.swift
//  AppleMarket
//
//  Created by 이소영 on 2022/12/28.
//

import SwiftUI

struct MyOrderDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("주문 상세 정보")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                Text("주문번호 : 12345678")
                    .font(.callout)
                Text("주문 접수 : 2022년 9월 7일")
                    .font(.callout)
                
                // 제품정보
                AsyncImage(url: URL(string: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/airpods-max-select-silver-202011?wid=470&hei=556&fmt=png-alpha&.v=1604021221000")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 240)
                        .padding(.leading, 50)
                } placeholder: {
                    ProgressView()
                }
                
          Text("AirPods Max - 실버")
                    .font(.callout)
                
                Text("2022년 9월 20일 배송완료")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.vertical, 5)
                
                Divider()
                    .padding(.vertical, 10)
                
                // 배송, 결제요약
                Group {
                    Text("배송 요약")
                        .font(.title3)
                        .padding(.bottom, 10)
                        .fontWeight(.bold)
                    Text("김멋사")
                    Text("010-1234-5678")
                    Text("서울 종로구 세종대로 167")
                    Text("1701호 멋쟁이사자처럼")
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
                            Text("₩ 750,000")
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
                            Text("₩ 750,000")
                                .font(.title3)
                                .padding(.bottom, 10)
                                .fontWeight(.bold)
                        }
                        .padding(.vertical, 10)
                    }
                    
                }
            }
            .padding(25)
        }
    }
}

struct MyOrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrderDetailView()
    }
}
