//
//  SignUpView.swift
//  AppleMarket
//
//  Created by 염성필 on 2022/12/27.
//

import SwiftUI


// MARK: - 회원가입 뷰
struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var nameText: String = ""
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var passwordAgainText: String = ""
    @State private var phoneNumberText: String = ""
    var body: some View {
        
        
        
        ScrollView {
            VStack(spacing: 30) {
                VStack {
                    Text("이메일 ID 생성")
                        .font(.largeTitle)
                       
                    Text("하나의 ID로 모든 서비스를 이용할 수 있습니다.")
                }
                .lineSpacing(10)
                
                CustomSignUpTextFieldView(nameText: $nameText, phoneNumberText: $phoneNumberText, emailText: $emailText, passwordText: $passwordText, passwordAgainText: $passwordAgainText)
                    .padding(.bottom, 15)
                
                Button {
                    print("회원가입 완료")
                    dismiss()
                } label: {
                    Text("회원 가입")
                        .frame(width: 100, height: 50)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.disabled(nameText.isEmpty || phoneNumberText.isEmpty || emailText.isEmpty || passwordText.isEmpty || passwordAgainText.isEmpty ? true : false)

                Spacer()
            }.padding()
        }
  
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}


// MARK: - 각종 텍스트 필드 ( 이름 ~ 암호 )
struct CustomSignUpTextFieldView: View {
    
    @Binding var nameText: String
    @Binding var phoneNumberText: String
    @Binding var emailText: String
    @Binding var passwordText: String
    @Binding var passwordAgainText: String
    
    var trimNameText: String {
        nameText.trimmingCharacters(in: .whitespaces)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            

            
            VStack(alignment: .leading) {
                Text("이름")
                TextField("이름을 입력해주세요", text: $nameText)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                .textInputAutocapitalization(.never)
            }
            
            VStack(alignment: .leading) {
                Text("전화번호")
                TextField("전화번호를 입력해주세요", text: $phoneNumberText)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                .textInputAutocapitalization(.never)
            }
      
            VStack(alignment: .leading) {
                Text("이메일")
                TextField("이메일을 입력해주세요", text: $emailText)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                .textInputAutocapitalization(.never)
            }
            
            VStack(alignment: .leading) {
                Text("비밀번호")
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
                    .cornerRadius(10)
              
            }
          
        }
    }
}
