//
//  LoginView.swift
//  AppleMarket
//
//  Created by 염성필 on 2022/12/27.
//

import SwiftUI

// MARK: - 로그인 뷰
struct LoginView: View {

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userInfoStore: UserInfoStore
    @State var emailText: String = ""
    @State var passwordText: String = ""
    @State var signInProcessing: Bool = false
    @Binding var isShowingLoginSheet: Bool
    var body: some View {
        
       
       
        NavigationStack {
            VStack(spacing: 15) {
                        
                        
                        Text("이메일로 로그인하세요")
                            .font(.largeTitle)
                            .lineSpacing(10)
                        
                        Group {
                            
                            CustomTextFieldView(emailText: $emailText, passwordText: $passwordText)
                            
                            //회원정보가 비어있으면
                            if !userInfoStore.errorMessage.isEmpty {
                                Text("회원 정보가 일치하지 않습니다.")
                                    .foregroundColor(.red)
                            }
                            
                            // 로그인 접속중에 signInProcessing = false 이거나 유저 정보가 비어있다면
                            if signInProcessing && userInfoStore.errorMessage.isEmpty {
                                ProgressView()
                            }
                        }
                        
                        
                        Button {
                            
                            signInProcessing = true
                            userInfoStore.emailAuthSignIn(email: emailText, password: passwordText)
                                print("로그인 되었습니다.")
                            isShowingLoginSheet.toggle()
                            dismiss()
                        } label: {
                                Text("로그인")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(buttonBackColor)
                                    .cornerRadius(10)
                                    .padding(.bottom, 40)
                        }
                        .disabled(emailText.isEmpty || passwordText.isEmpty ? true : false)

                        IdAndPasswordFindView()
                    }
            .padding()
        }
        
        
    }
    
    var buttonBackColor: Color {
        emailText.isEmpty || passwordText.isEmpty == true ? .gray : .red
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoginView(isShowingLoginSheet: .constant(true))
                .environmentObject(UserInfoStore())
        }
    }
}



// MARK: - 로그인 텍스트 필드 및 로그인 버튼
struct CustomTextFieldView: View {
    
    @Binding var emailText: String
    @Binding var passwordText: String
    
    var body: some View {
        VStack {
            TextField("이메일을 입력하세요", text: $emailText)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            SecureField("비밀번호를 입력하세요", text: $passwordText)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding(.bottom, 30)

            
        }
    }
}


// MARK: - 회원가입 뷰로 넘어가기
struct IdAndPasswordFindView: View {
    var body: some View {
       
        
            HStack {
                    Text("아이디가 없으십니까?")
              
                    NavigationLink {
                        SignUpView()
                    } label: {
                        HStack {
                            Text("지금 만드세요.")
                            Image(systemName: "arrow.up.forward")
                                
                        }
                    }
        }
    }
}
