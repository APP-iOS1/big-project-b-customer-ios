//
//  MyProfileView.swift
//  AppleMarket
//
//  Created by Jero on 2022/12/27.
//

import SwiftUI

struct MyProfileView: View {
    let listTitle: [String] = ["내 기기 추가", "주소지 등록"]
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Spacer()
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Text("완료")
                            .font(.title3)
                            .bold()
                    }
                }
                Text("계정")
                    .font(.largeTitle)
                    .bold()
                
                List {
                    Section {
                        HStack {
                            AsyncImage(url: URL(string: "https://mblogthumb-phinf.pstatic.net/MjAxNzEyMTFfMjA3/MDAxNTEyOTg0MTU3MzMz.wOvG_aS8a9vm44iNUmgby2-oG2u4aPAZ9lkOgyFqT7Ag.8qIDSv7H3yMjgKynzob12maeIvqeE1IrEtscN8MV0Uog.JPEG.jung02140214/IMG_2189.jpg?type=w800")) { image in
                                image
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(22)
                            } placeholder: {
                                ProgressView()
                            }
                            
                            VStack(alignment:. leading) {
                                Text("신미지")
                                Text("shinn.mizzz@gmail.com")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .frame(height: 55)
                    ForEach(listTitle, id: \.self) { title in
                        NavigationLink {
                            
                        } label: {
                            Text(title)
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Text("로그아웃")
                    }

                }
                Spacer()
            }
            .padding()
            .background(Color("myPageBGColor"))
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    @State static var isShowingSheet: Bool = false
    static var previews: some View {
        MyProfileView(isShowingSheet: $isShowingSheet)
    }
}
