//
//  ShippingView.swift
//  AppleMarket
//
//  Created by 이소영 on 2022/12/27.
//

import SwiftUI

struct ShippingView: View {
    @ObservedObject var orderStore: OrderStore
    
    @State private var addressText: String = ""
    @State private var receiverName: String = ""
    @State private var contactNumber: String = ""
    @State private var address: String = ""
    @State var address1: String = ""
    @State var address2: String = ""
    @State var address3: String = ""
    @State var address4: String = ""
    
    var body: some View {
        NavigationView {
        ScrollView {
                VStack(alignment: .leading) {
                    Text("배송 및 결제 정보")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 30)
                    
                    Text("수령인 주소 :")
                        .font(.title3)
                        .padding(.bottom, 10)
                        .fontWeight(.bold)
                    
                    ShippingInformation(receiverName: $receiverName, contactNumber: $contactNumber, address1: $address1, address2: $address2, address3: $address3, address4: $address4)
                        .padding(.bottom, 20)
                    
                    Divider()
                        .padding(.bottom, 30)
                    
                    // 결제방법
                    Text("결제 방법 :")
                        .font(.title3)
                        .padding(.bottom, 10)
                        .fontWeight(.bold)
                    VStack(alignment: .leading) {
                        Button(action: {
                            print("결제방법 선택")
                        }) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("무통장 입금")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .padding(.bottom, 1)
                                    Text("일시불")
                                        .font(.subheadline)
                                }
                                Spacer()
                                
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
                    
                    NavigationLink(destination: CheckOrderView(address: addressText)) {
                        Text("결제 페이지로 이동")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 310, height: 20)
                            .padding(20)
                    }
                    .background(.blue)
                    .cornerRadius(15)
                    .simultaneousGesture(TapGesture().onEnded({
                                            addressText = address1 + " " + address2 + " "  + address3 + " " + address4
                                        }))
                }
                .padding(25)
            }
        }
    }
}

struct ShippingInformation: View {
    @Binding var receiverName: String
    @Binding var contactNumber: String
    @Binding var address1: String
    @Binding var address2: String
    @Binding var address3: String
    @Binding var address4: String
    
    var body: some View {
        VStack{
            TextField("이름", text: $receiverName)
                .padding()
                .foregroundColor(.black)
                .frame(width: 350, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 10)
            
            // 숫자만 입력되게 해야함!
            TextField("휴대폰 번호", text: $contactNumber)
                .padding()
                .foregroundColor(.black)
                .frame(width: 350, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 10)
            
            TextField("시 / 도", text: $address1)
                .padding()
                .foregroundColor(.black)
                .frame(width: 350, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 10)
            
            TextField("지역 / 도시", text: $address2)
                .padding()
                .foregroundColor(.black)
                .frame(width: 350, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 10)
            
            TextField("건물 번지 또는 거리 이름", text: $address3)
                .padding()
                .foregroundColor(.black)
                .frame(width: 350, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 10)
            
            TextField("아파트명, 호실 등 (선택 사항)", text: $address4)
                .padding()
                .foregroundColor(.black)
                .frame(width: 350, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 10)
        }
    }
}

struct ShippingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ShippingView(orderStore: OrderStore())
        }
    }
}
