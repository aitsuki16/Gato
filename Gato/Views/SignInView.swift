//
//  LogIn.swift
//  Gato
//
//  Created by Ai on 2022/11/13.
//

import SwiftUI

struct SignInView: View {
    @State var isAtMaxScale = false
    @State var showPassword: Bool = false
    @State private var joke: String = ""

    @ObservedObject var signInModel = SignInModel()

    @State private var shouldNavigateToMyPage = false
    @State private var isSignedIn = false
    @State private var isSignInSuccessful = false

    var isSignInButtonDisabled: Bool {
        [signInModel.email, signInModel.password].contains(where: \.isEmpty)
    }

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [Color("Color-1"), Color("Color")],
                    startPoint: .trailing,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 1) {
                    Spacer()

                    ZStack {
                        ImageView()
                    }.frame(height: 195)

                    Spacer()

                    TextField("Email",
                              text: $signInModel.email,
                              prompt: Text("Email").foregroundColor(.gray)
                    )
                    .font(Font.system(size: 25))
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.white, lineWidth: 0.5)
                    }
                    .padding(.vertical)

                    HStack {
                        Group {
                            if showPassword {
                                TextField("Password",
                                          text: $signInModel.password,
                                          prompt: Text("Password").foregroundColor(.white))
                            } else {
                                SecureField("Password",
                                            text: $signInModel.password,
                                            prompt: Text("Password").foregroundColor(.gray))
                            }
                        }
                        .font(Font.system(size: 23))
                        .keyboardType(.emailAddress)
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.white, lineWidth: 0.5)
                            HStack {
                                Button {
                                    showPassword.toggle()
                                } label: {
                                    Image(systemName: showPassword ? "pawprint" : "pawprint")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                                }.padding()
                            }
                        }.padding(.vertical)
                    }

                    Button(
                        action: {
                            signInModel.signIn { result in
                                DispatchQueue.main.async {
                                    switch result {
                                    case .success():
                                        isSignInSuccessful = true
                                    case .failure(let error):
                                        print("Sign-in failed with error: \(error.localizedDescription)")
                                        isSignInSuccessful = false
                                    }
                                }
                            }
                        },
                        label: {
                            Text("Log In")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                        }
                    )
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(
                        isSignInButtonDisabled ?
                        LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(22)
                    .disabled(isSignInButtonDisabled)

                    if isSignInSuccessful {
                        NavigationLink(destination: MypageView(), isActive: $isSignInSuccessful) {
                           
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
