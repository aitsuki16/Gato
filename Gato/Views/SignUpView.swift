//
//  SignUp.swift
//  Gato
//
//  Created by Ai on 2022/11/26.
//

import SwiftUI
import Combine

struct SignUp: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var isFirstViewActive: Bool
    
    @State var zoom = false
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var comfirmPassword = ""
    @State var showPassword: Bool = false
    @State var signUpResult: Result<TokenResponse, Error>? = nil as Result<TokenResponse, Error>?
    @State var cancellable: AnyCancellable?
    @State var isSignUpSuccessful = false
    @State var hasError = false
    
    let timer = Timer.publish(every: 2.1, on: .main, in: .common).autoconnect()
    var isSignUpButtonDisabled: Bool {
        [name,email, password].contains(where: \.isEmpty)
    }
    let model = SignUpModel()
    
    var body: some View {
        
        ZStack {
            //custom background color here
            LinearGradient(
                colors: [Color("Color"), Color("Color-2")],
                startPoint: .topLeading,
                endPoint: .center
            )
            .cornerRadius(18)
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                ImageView()
                Spacer()
                
                TextField("Name",
                          text: $name ,
                          prompt: Text("Name").foregroundColor(.white)
                          
                )
                .font(Font.system(size: 25))
                
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white, lineWidth: 1)
                }
                
                TextField("Email",
                          text: $email ,
                          prompt: Text("Email").foregroundColor(.white)
                )
                .font(Font.system(size: 25))
                
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white, lineWidth: 1)
                }
                HStack {
                    Group {
                        if showPassword {
                            TextField("Password",
                                      text: $password,
                                      prompt: Text("Password").foregroundColor(.white))
                        } else {
                            SecureField("Password",
                                        
                                        text: $password,
                                        prompt: Text("Password").foregroundColor(.white))
                        }
                    }
                    .font(Font.system(size: 23))
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.white, lineWidth: 1)
                        
                        HStack {
                            Button {
                                showPassword.toggle()
                            } label: {
                                Image(systemName: showPassword ? "pawprint" : "pawprint")
                                    .foregroundColor(showPassword ? .black : .white)
                                
                            }.padding(.leading, 300)
                        }
                    }.padding(.vertical)
                }
                Button {
                    print("do sign Up action")
                    cancellable = model.signUp(user: User(name: name, email: email, password: password))
                        .sink(
                            receiveCompletion: { result in
                                switch result {
                                case .failure(let error):
                                    signUpResult = .failure(error)
                                    print("Sign-up failed with error: \(error)")
                                    hasError = true
                                case .finished:
                                    print("Sign-up operation completed.")
                                }
                            }, receiveValue: { tokenResponse in
                                signUpResult = .success(tokenResponse)
                                isSignUpSuccessful = true
                                print("Sign-up successful. Token: \(tokenResponse.token)")
                            })
                } label: {
                    Text("Sign Up")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(
                    isSignUpButtonDisabled ?
                    LinearGradient(colors: [.indigo], startPoint: .topLeading, endPoint: .bottomTrailing) :
                        LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    
                    
                )
                .cornerRadius(22)
                .disabled(isSignUpButtonDisabled)
                
                if hasError {
                    Text(model.errorMessage ?? "")
                        .foregroundColor(.pink)
                        .font(.callout)
                        .bold()
                }
            }
            .padding()
            
            NavigationLink(destination: MypageView(isFirstViewActive: $isFirstViewActive), isActive: $isSignUpSuccessful) {
                EmptyView()
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                    
                } label: {
                    HStack {
                        Image(systemName: "pawprint.fill")
                            .foregroundColor(.yellow)
                        Text("Back")
                            .foregroundColor(.white)
                    }
                }
                .ignoresSafeArea()
                
            }
            
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    @State static var isFirstViewActive: Bool = false
    
    static var previews: some View {
        SignUp(isFirstViewActive: $isFirstViewActive)
    }
}
