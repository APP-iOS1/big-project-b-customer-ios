//
//  SearchResultView.swift
//  AppleMarket
//
//  Created by 한승수 on 2022/12/27.
//

import SwiftUI

struct SearchResultView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: SearchViewModel
    @State var showMyDeviceModal : Bool = false
    @State var showEtcModal: Bool = false
    
    var body: some View {
        
            VStack {
                VStack {
                    
                    //MARK: 필터 버튼
                    HStack {
                        Text("필터: ")
                            .bold()
                            .padding(.bottom, 8)
                        Button {
                            // 내 기기 필터 모달 동작
                            showMyDeviceModal = true
                        } label: {
                            Text("내 기기")
                                .font(.system(size: 17))
                                .frame(width: 80, height: 40)
                                .foregroundColor(.black)
                                .overlay (
                                    filterButton()
                                )
                        }
                        .background(.white)
                        .cornerRadius(4)
                        .sheet(isPresented: $showMyDeviceModal) {
                            MyDeviceFilterView()
                        }
                        .padding(.bottom, 8)
                        /*
                        Button {
                            // 기타 필터 모달 동작
                            showEtcModal = true
                        } label: {
                            Text("기타")
                                .font(.system(size: 17))
                                .frame(width: 80, height: 40)
                                .foregroundColor(.black)
                                .overlay (
                                    filterButton()
                                )
                        }
                        .background(.white)
                        .cornerRadius(4)
                        .sheet(isPresented: $showEtcModal) {
                            EtcFilterView()
                        }
                        */
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                }
                .background(Color(UIColor.systemGray6))
                .padding(.bottom, -8)
                
                Divider()
                
                //MARK: 검색결과 스크롤뷰
                ScrollView {
                    VStack {
                        HStack {
                            Text("최우선 결과")
                                .font(.headline)
                                .bold()
                            Spacer()
                        }
                        .padding(.top, 12)
                        .padding(.leading, 20)
                        
                        //MARK: 최우선 결과
                        NavigationLink {
                            // 최우선 결과 제품 디테일뷰 이동
                            ContentView()
                        } label: {
//                            ZStack {
//                                Rectangle().fill(Color(red: 245/255, green: 245/255, blue: 247/255))
//                                    .frame(width: 350, height: 250)
                                firstItemcell
//                            }
                        }
                        //firstItemOrderInfoView
                        
                        //MARK: 추가 결과
                        if viewModel.searchResults.count > 1 {
                            HStack {
                                Text("추가 결과")
                                    .font(.headline)
                                    .bold()
                                Spacer()
                            }
                            .padding(.top, 12)
                            .padding(.leading, 20)
                            
                            Divider()
                        }
                        ForEach (Array(viewModel.searchResults.enumerated()), id: \.offset) { index, item in
                            if index > 0 {
                                NavigationLink {
                                ContentView()
                            } label: {
                                HStack {
                                    AsyncImage(url: URL(string: item.thumbnailImage )) { img in
                                        img
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 80, height: 80)
                                            .padding(.horizontal, 50)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 80, height: 80)
                                    }

                                    VStack(alignment: .leading) {
                                        Text(item.productName)
                                            .bold()
                                        Text("가격정보 : \(item.price)")
                                        Text(item.status == 1 ? "구매 가능" : "재고 없음")
                                    }
                                    .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                                Divider()
                            }
                        }
                    }
                }
                Spacer()
            }
            .onAppear {
                //userInfoStore.fetchUserInfo()
                viewModel.sortByPrice()
            }

        
    }
}



func filterButton() -> some View {
    RoundedRectangle(cornerRadius: 4)
        .strokeBorder(Color(UIColor.systemGray3), lineWidth: 1.5)
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(viewModel: SearchViewModel())
    }
}

extension SearchResultView {
    
    var firstItemcell: some View {
        VStack {
//            Image("sample_airpods")
//                .resizable()
//                .frame(width: 100, height: 110)
//                .aspectRatio(contentMode: .fit)
            
            //MARK: 뷰모델의 검색결과가 빈 배열일 때 index out of range 오류를 해결하기 위한 조치
            // 검색결과가 없을 때의 대응 필요함
            AsyncImage(url: URL(string: viewModel.getFirstElement()?.thumbnailImage ?? "")) { Image in
                Image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 260)
                    .cornerRadius(15)
                    .shadow(radius: 10)
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 110)
            }

            VStack {
                HStack {
                    Text("New")
                        .foregroundColor(.orange)
                    Spacer()
                }
                .padding(.leading, 20)
                HStack {
                    Text(viewModel.getFirstElement()?.productName ?? "제품이름을 가져올 수 없습니다")
                        .foregroundColor(.black)
                        .bold()
                    Spacer()
                }
                .padding(.leading, 20)
                HStack {
                    Text("₩\(viewModel.getFirstElement()?.price ?? 0)")
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.leading, 20)
            }
            .offset(y: -80)
            .padding(.bottom, -80)
        }
        .padding(.horizontal, 20)
    }
    
//
//    var firstItemOrderInfoView: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                Text("오늘 주문 시 배송:")
//                Spacer()
//            }
//            Text("목 2022/12/29 - 무료 배송")
//                .foregroundColor(Color(UIColor.systemGray2))
//                .padding(.bottom, 12)
//            Text("지금 주문하기. 매장 내 픽업:")
//            Text("오늘, 위치: Apple 가로수길")
//                .foregroundColor(Color(UIColor.systemGray2))
//        }
//        .padding(.horizontal, 20)
//        .padding(.top, 20)
//    }
}



