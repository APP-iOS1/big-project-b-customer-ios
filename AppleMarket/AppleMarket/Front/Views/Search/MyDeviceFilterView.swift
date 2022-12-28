//
//  MyDeviceFilterView.swift
//  AppleMarket
//
//  Created by 한승수 on 2022/12/27.
//

import SwiftUI

struct MyDeviceFilterView: View {
    
    @Environment(\.presentationMode) var presentation
    //@Binding var showMyDeviceModal: Bool
    @Environment(\.dismiss) var dismiss
    @State var myDeviceList = ["iPhone 12", "iPad Pro", "MacBook Air"]
    var body: some View {
        
        NavigationView{
            ScrollView {
                VStack {
                    HStack {
                        Text("기기와 호환되는 제품을 찾아보세요.")
                            .font(.headline)
                            .bold()
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    // 없음 버튼
                    Button {
                        dismiss()
                    } label: {
                        Rectangle()
                            .fill(.white)
                            .frame(height: 130)
                            .cornerRadius(15)
                            .overlay{
                                RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder(.gray, lineWidth: 1)
                                Text("없음")
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal, 20)
                        
                    }
                    
                    // 내 기기에 등록된 개수만큼의 버튼
                    ForEach (myDeviceList, id: \.self) { _ in
                        Button {
                            dismiss()
                            // 필터 동작 함수
                        } label: {
                            Rectangle()
                                .fill(.white)
                                .frame(height: 130)
                                .cornerRadius(15)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 15)
                                        .strokeBorder(.gray, lineWidth: 1)
                                    Text("내 기기 제품 명")
                                        .foregroundColor(.black)
                                }
                        }
                        
                        
                        
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                }
                .navigationBarTitle("내 기기")
                .toolbarBackground(Color(UIColor.systemGray6), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button("취소") {
                    dismiss()
                })
            }
        }
    }
    
}

struct MyDeviceFilterView_Previews: PreviewProvider {
    static var previews: some View {
        MyDeviceFilterView()
    }
}
