//
//  LoginView.swift
//  AppleMarket
//
//  Created by 염성필 on 2022/12/27.
//

import SwiftUI

// focus를 위한 열거형
enum Field {
    case email
    case password
}


// MARK: - 로그인 뷰
struct LoginView: View {
    @State var emailText: String = ""
    @State var passwordText: String = ""
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 15) {
                
                
                Text("이메일로 로그인하세요")
                    .font(.largeTitle)
                    .lineSpacing(10)
                
                CustomTextFieldView(emailText: $emailText, passwordText: $passwordText)
                
                
           
               //
                IdAndPasswordFindView()
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



// MARK: - 로그인 텍스트 필드 및 로그인 버튼
struct CustomTextFieldView: View {
    @Binding var emailText: String
    @Binding var passwordText: String
    @FocusState private var focusField: Field?
    
    var body: some View {
        VStack {
            TextField("이메일을 입력하세요", text: $emailText)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
                .focused($focusField, equals: .email)
            SecureField("비밀번호를 입력하세요", text: $passwordText)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding(.bottom, 30)
                .focused($focusField, equals: .password)
            
            Button {
                if emailText.isEmpty {
                    focusField = .email
                } else if passwordText.isEmpty {
                    focusField = .password
                } else {
                    // 텍스트 필드 작성후 로그인 누르면 키보드 내려감
                    hideKeyboard()
                    print("로그인 되었습니다.")
                }
            } label: {
                    Text("로그인")
                        .padding()
                        .foregroundColor(.white)
                        .background(buttonBackColor)
                        .cornerRadius(10)
                        .padding(.bottom, 40)
            }
            .disabled(emailText.isEmpty || passwordText.isEmpty ? true : false)
            
        }
    }
    
    var buttonBackColor: Color {
        return emailText.isEmpty || passwordText.isEmpty == true ? .gray : .blue
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


// MARK: - 완료시 키보드 내리기
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
