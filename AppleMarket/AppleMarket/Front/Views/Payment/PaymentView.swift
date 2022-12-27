//
//  PaymentView.swift
//  AppleMarket
//
//  Created by 이소영 on 2022/12/27.
//

import SwiftUI

struct PaymentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("재고가 있으며, 배송이 가능합니다.")
                        .font(.title)
                        .bold()
                    HStack {
                        Rectangle()
                            .frame(width: 60, height: 60)
                        Text("AirPods Max - 실버")
                            .padding(.leading, 10)
                    }
                    .padding(.bottom, 30)
                    VStack(alignment: .leading) {
                        Text("배송 방법:")
                            .padding(.bottom, 10)
                            .fontWeight(.bold)
                        Button(action: {
                            print("주문제품 선택")
                        }) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("익일")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .padding(.bottom, 1)
                                    Text("표준 배송")
                                        .font(.subheadline)
                                }
                                Spacer()
                                
                                Text("무료")
                            }
                            .foregroundColor(.black)
                            .padding(20)
                            .frame(width: 350, height: 80)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                        }
                        
                    }
                    .padding(.bottom, 30)
                    
                    Divider()
                        .padding(.bottom, 30)
                    Button(action: {
                    }) {
                        NavigationLink(destination: ShippingView()) {
                            Text("배송 정보 입력하기")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 310, height: 20)
                                .padding(20)
                            
                        }
                        .background(.blue)
                        .cornerRadius(15)
                    }
                }

                .padding(.leading, 22)
            }
        }
        
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PaymentView()
        }
    }
}
