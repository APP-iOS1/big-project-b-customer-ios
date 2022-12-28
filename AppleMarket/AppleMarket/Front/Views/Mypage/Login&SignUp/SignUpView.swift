//
//  SignUpView.swift
//  AppleMarket
//
//  Created by 염성필 on 2022/12/27.
//

import SwiftUI
import FirebaseAuth

// MARK: - 회원가입 뷰
struct SignUpView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userInfoStore: UserInfoStore
    @State private var nameText: String = ""
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var passwordAgainText: String = ""
    @State private var adressText: String = ""
    @State var signUpProcessing = false
    @State var isShowingAlert: Bool = false
    var body: some View {
        
        ScrollView {
            VStack(spacing: 30) {
                VStack {
                    Text("이메일 ID 생성")
                        .font(.largeTitle)
                       
                    Text("하나의 ID로 모든 서비스를 이용할 수 있습니다.")
                }
                .lineSpacing(10)
                
                CustomSignUpTextFieldView(nameText: $nameText, adressText: $adressText, emailText: $emailText, passwordText: $passwordText, passwordAgainText: $passwordAgainText)
                    .padding(.bottom, 15)
                
                Button {
                    signUpProcessing = true
                    userInfoStore.emailAuthSignUp(email: emailText, userName: nameText, password: passwordText, address: adressText, phoneNumber: "", myDevices: [])
                    
                    // errormessage가 존재한다면 회원가입 실패로 처리
                    if !userInfoStore.signUpState {
                        signUpProcessing = false
                    }
                    print("회원가입 완료")
                    isShowingAlert = true
                } label: {
                    Text("회원 가입")
                    
                        .frame(width: 100, height: 50)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    // 얼럿트 창 
                        .alert(" ", isPresented: $isShowingAlert) {
                            Button {
                              dismiss()
                            } label: {
                                Text("OK")
                            }

                        } message: {
                            Text("회원가입이 완료되었습니다.")
                        }
                }
               
                .disabled(nameText.isEmpty || adressText.isEmpty || emailText.isEmpty || passwordText.isEmpty || passwordAgainText.isEmpty ? true : false)
                
                // 회원가입 과정이 false이면   ProgressView() 실행
                if signUpProcessing {
                    ProgressView()
                }
                
                if !userInfoStore.errorMessage.isEmpty {
                    Text("회원 정보가 일치하지 않습니다.")
                        .foregroundColor(.red)
                }

                Spacer()
            }.padding()
                .onAppear{
                    userInfoStore.signUpState = false
                }
        }
  
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(UserInfoStore())
    }
}


// MARK: - 각종 텍스트 필드 ( 이름 ~ 암호 )
struct CustomSignUpTextFieldView: View {
    
    @Binding var nameText: String
    @Binding var adressText: String
    @Binding var emailText: String
    @Binding var passwordText: String
    @Binding var passwordAgainText: String

    var body: some View {
        VStack(spacing: 20) {
            

            
            VStack(alignment: .leading) {
                Text("이름")
                    .font(.headline)
                TextField("이름을 입력해주세요", text: $nameText)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                .textInputAutocapitalization(.never)
            }
      
            VStack(alignment: .leading) {
                Text("이메일")
                    .font(.headline)
                TextField("이메일을 입력해주세요", text: $emailText)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                .textInputAutocapitalization(.never)
            }
            
            VStack(alignment: .leading) {
                Text("주소")
                    .font(.headline)
                TextField("주소를 입력해주세요", text: $adressText)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                .textInputAutocapitalization(.never)
            }
            
            VStack(alignment: .leading) {
                Text("비밀번호")
                    .font(.headline)
                SecureField("비밀번호를 입력해주세요", text: $passwordText)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
               
            }
            
            VStack(alignment: .leading) {
                Text("비밀번호 재확인")
                SecureField("비밀번호를 입력해주세요", text: $passwordAgainText)
                    .padding()
                    .background(.thinMaterial)
                    .border(.red, width: passwordAgainText != passwordText ? 1 : 0)
                    .cornerRadius(10)
              
            }
          
        }
    }
}
