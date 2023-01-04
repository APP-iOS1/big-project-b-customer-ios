//
//  CheckOrderView.swift
//  AppleMarket
//
//  Created by 이소영 on 2022/12/27.
//

import SwiftUI

struct CheckOrderView: View {
    @State var isCheck = false
    // @StateObject var orderStore: OrderStore = OrderStore()
    @EnvironmentObject var userStore: UserInfoStore
    @EnvironmentObject var orderStore: OrderStore
    
    var orderName: String
    var orderPhone: String
    var orderAddress: String
    
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
                        var _ = print("orderStore.products : \(orderStore.products)")
                        
                        HStack {
                            ForEach(orderStore.products, id: \.self) { product in
                                var _ = print("product : \(product)")
                                AsyncImage(url: URL(string: product.image[0])) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                } placeholder: {
                                    ProgressView()
                                }
                                VStack(alignment: .leading) {
                                    Text("\(product.id)")
                                        .padding(.bottom, -3)
                                    Text("\(product.productCount)")
                                        .padding(.bottom, -3)
                                    Text("₩ \(product.price)")
                                        .bold()
                                }
                                .padding(.leading, 10)
                            }
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
                            Text("\(orderName)")
                            Text("\(orderPhone)")
                            Text("\(orderAddress)")
                                .padding(.bottom, 20)
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
                                .padding(.leading, 3)
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
                                    .padding(.leading, 3)
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
                        ForEach(orderStore.products, id: \.self) { product in
                            var _ = print("product : \(product)")
                            VStack(alignment: .leading) {
                                Text("총계")
                                    .font(.title3)
                                    .padding(.bottom, 10)
                                    .fontWeight(.bold)
                                // 바꿔야할부분
                                HStack {
                                    Text("소계")
                                        .padding(.leading, 3)
                                    Spacer()
                                    Text("₩ \(product.totalPrice)")
                                }
                                .padding(.bottom, 5)
                                HStack {
                                    Text("배송")
                                        .padding(.leading, 3)
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
                                    Text("₩ \(product.totalPrice)")
                                        .font(.title3)
                                        .padding(.bottom, 10)
                                        .fontWeight(.bold) //
                                }
                                .padding(.vertical, 20)
                            }
                        }
                    }
                    
                    // 결제버튼
                    NavigationLink(destination: MyOrderView()) {
                        Text("결제하기")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 310, height: 20)
                            .padding(20)
                    }
                    .background(Color("MainColor"))
                    .cornerRadius(15)
                    .simultaneousGesture(TapGesture().onEnded {
                        orderStore.addOrder(user: userStore.userInfo!,
                                            products: orderStore.products,
                                            orderInfo: Order(orderName : orderName ,
                                                             orderPhone : orderPhone ,
                                                             orderAddress : orderAddress ))
                    })
                }
                .padding(25)
            }
        }
    }
}

//struct CheckOrderView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckOrderView(order: Order(orderName: "", orderPhone: "", orderAddress: ""), address: "", receiverName: "", contactNumber: "")
//
//    }
//}
