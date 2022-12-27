//
//  SearchResultView.swift
//  AppleMarket
//
//  Created by 한승수 on 2022/12/27.
//

import SwiftUI

struct SearchResultView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var inputSearch: String = ""
    @State var showMyDeviceModal : Bool = false
    @State var showEtcModal: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    
                    //MARK: 검색창 및 취소 버튼
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("제품 및 매장 검색", text: $inputSearch)
                        }
                        .padding()
                        .frame(height: 36)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(15)
                        .textInputAutocapitalization(.never)
                        .lineLimit(1)
                        
                        NavigationLink {
                            SearchView()
                        } label: {
                            Text("취소")
                                .foregroundColor(Color("MainColor"))
                        }
                        .navigationBarBackButtonHidden(true)
                    }
                    .padding(.horizontal, 20)
                    
                    //MARK: 필터 버튼
                    HStack {
                        Text("필터: ")
                            .bold()
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
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    
                }
                .background(Color(UIColor.systemGray6))
                .padding(.bottom, -8)
                
                Divider()
                
                //MARK: 검색결과 스크롤뷰
                ScrollView {
                    VStack {
                        HStack {
                            Text("최우선 결과")
                                .font(.title)
                                .bold()
                            Spacer()
                        }
                        .padding([.leading, .top], 20)
                        
                        //MARK: 최우선 결과
                        NavigationLink {
                            // 최우선 결과 제품 디테일뷰 이동
                            ContentView()
                        } label: {
                            ZStack {
                                Rectangle().fill(.white)
                                    .frame(width: 350, height: 250)
                                    .cornerRadius(15)
                                    .shadow(radius: 10)
                                FirstItemCell()
                            }
                        }
                        FirstItemOrderInfoView()
                        
                        //MARK: 추가 결과
                        HStack {
                            Text("추가 결과")
                                .font(.title)
                                .bold()
                            Spacer()
                        }
                        .padding([.leading, .top], 20)
                        
                        Divider()
                        
                        ForEach (0..<15) { _ in
                            NavigationLink {
                                ContentView()
                            } label: {
                                HStack {
                                    Image("sample_airpods")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 80, height: 80)
                                        .padding(.horizontal, 50)
                                    VStack {
                                        Text("AirPods Pro")
                                            .bold()
                                        Text("가격정보")
                                        Text("출고, 배송 여부")
                                    }
                                    .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            Divider()
                        }
                    }
                }
                Spacer()
            }
        }
    }
}



func filterButton() -> some View {
    RoundedRectangle(cornerRadius: 4)
        .strokeBorder(Color(UIColor.systemGray3), lineWidth: 1.5)
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView()
    }
}

class Model: ObservableObject {
    @Published var pushed = false
}

struct FirstItemCell: View {
    var body: some View {
        VStack {
            Image("sample_airpods")
                .resizable()
                .frame(width: 100, height: 110)
                .aspectRatio(contentMode: .fit)
            HStack {
                Text("New")
                    .foregroundColor(.orange)
                Spacer()
            }
            .padding(.leading, 20)
            HStack {
                Text("AirPods Pro(2세대)")
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
            .padding(.leading, 20)
            HStack {
                Text("₩359,000")
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.leading, 20)
        }
        .padding(.horizontal, 20)
    }
}

struct FirstItemOrderInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("오늘 주문 시 배송:")
            Text("목 2022/12/29 - 무료 배송")
                .foregroundColor(Color(UIColor.systemGray2))
            
            Text("지금 주문하기. 매장 내 픽업:")
            Text("오늘, 위치: Apple 가로수길")
                .foregroundColor(Color(UIColor.systemGray2))
        }
        
    }
}
