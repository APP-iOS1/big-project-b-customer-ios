//
//  CheckOrderView.swift
//  AppleMarket
//
//  Created by 이소영 on 2022/12/27.
//

import SwiftUI

struct CheckOrderView: View {
    @State var isCheck = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .leading) {
                    Text("주문하시겠습니까? 입력하신 사항이 모두 정확한지 확인해주십시오.")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 30)
                    
                    VStack(alignment: .leading) {
                        // 주문내역 확인
                        Text("주문 내역")
                            .font(.title3)
                            .padding(.bottom, 10)
                            .fontWeight(.bold)
                        HStack {
                            AsyncImage(url: URL(string: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/airpods-max-select-silver-202011?wid=470&hei=556&fmt=png-alpha&.v=1604021221000")) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            } placeholder: {
                                ProgressView()
                            }
                            VStack(alignment: .leading) {
                                Text("AirPods Max - 실버")
                                    .padding(.bottom, -3)
                                Text("1")
                                    .padding(.bottom, -3)
                                Text("₩ 750,000")
                                    .bold()
                            }
                            .padding(.leading, 10)
                        }
                        .padding(.bottom, 30)
                        
                        Divider()
                            .padding(.bottom, 30)
                        
                        // 배송정보 확인
                        Group {
                            Text("배송 상세 정보")
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
                        
                        Divider()
                            .padding(.bottom, 30)
                        
                        // 결제정보 확인
                        Group {
                            Text("결제 상세 정보")
                                .font(.title3)
                                .padding(.bottom, 10)
                                .fontWeight(.bold)
                            Text("결제 수단: 무통장 입금")
                        }
                        .padding(.bottom, -1)
                    }
                    .padding(.bottom, 30)
                    
                    Divider()
                        .padding(.bottom, 20)
                    
                    // 이용 약관 체크
                    Group {
                        Text("이용 약관")
                            .font(.title3)
                            .padding(.bottom, 10)
                            .fontWeight(.bold)
                        
                        HStack(alignment: .top){
                            Button {
                                isCheck.toggle()
                            } label: {
                                Image(systemName: isCheck ? "checkmark.square.fill" : "checkmark.square.fill")
                                    .foregroundColor(isCheck ? .blue : .gray)
                            }
                            HStack {
                                Text("개인정보 취급방침에 따라 개인정보를 수집 및 사용하고, 제 3자에 제공 및 처리한다는 점에 동의합니다. (필수)")
                            }
                            .font(.callout)
                            
                        }
                        .frame(height: 70)
                        .padding(.bottom, 20)
                    }
                    Divider()
                        .padding(.bottom, 30)
                    
                    // 총액 확인
                    Group {
                        VStack(alignment: .leading) {
                            Text("총계")
                                .font(.title3)
                                .padding(.bottom, 10)
                                .fontWeight(.bold)
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
                            .padding(.vertical, 20)
                        }
                        
                    }
                    
                    
                    // 결제버튼
                    
                    Button(action: {
                        print("결제완료 및 화면전환")
                    }) {
                        Text("결제하기")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 310, height: 20)
                            .padding(20)
                    }
                    .background(Color("MainColor"))
                    .cornerRadius(15)
                }
                .padding(25)
            }
        }
    }
}

struct CheckOrderView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOrderView()
    }
}
