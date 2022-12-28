//
//  ShippingView.swift
//  AppleMarket
//
//  Created by 이소영 on 2022/12/27.
//

import SwiftUI

struct ShippingView: View {
    @State private var addressText: String = ""
    
    var body: some View {
        NavigationView {
        ScrollView {

                VStack(alignment: .leading) {
                    Text("배송 및 결제 정보")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 30)
                    
                    
                    Text("주소 입력:")
                        .font(.title3)
                        .padding(.bottom, 10)
                        .fontWeight(.bold)
                    
                    ShippingInformation()
                        .padding(.bottom, 20)
                    
                    Divider()
                        .padding(.bottom, 30)
                    
                    
                    // 결제방법
                    Text("결제 방법:")
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
                    
                    Button(action: {
                    }) {
                        NavigationLink(destination: CheckOrderView()) {
                            Text("결제 페이지로 이동")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 310, height: 20)
                                .padding(20)
                        }
                        .background(Color("MainColor"))
                        .cornerRadius(15)
                    }
                }
                .padding(25)
            }
        }
    }
}

struct ShippingInformation: View {
    @State private var name: String = ""
    @State private var contactNumber: String = ""
    @State private var address1: String = ""
    @State private var address2: String = ""
    @State private var address3: String = ""
    @State private var address4: String = ""
    @State private var zipCode: Int = 0
    
    var body: some View {
        VStack{
            TextField("이름", text: $name)
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
            ShippingView()
        }
    }
}
