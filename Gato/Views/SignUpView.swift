//
//  SignUp.swift
//  Gato
//
//  Created by Ai on 2022/11/26.
//

import SwiftUI
import Combine

struct SignUp: View {
    //trying
    @State var zoom = false
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var comfirmPassword = ""
    @State var showPassword: Bool = false
    @State var phone: String = ""
    @State var signUpResult: Result<User, Error>? = nil as Result<User, Error>?
    @State var cancellable: AnyCancellable?
    @State var isSignUpSuccessful = false
    
    let timer = Timer.publish(every: 2.1, on: .main, in: .common).autoconnect()
    var isSignUpButtonDisabled: Bool {
        [name,email, password,phone].contains(where: \.isEmpty)
    }
    let model = SignUpModel()
    
    var body: some View {
        NavigationView {
            
            ZStack {
                //custom background color here
                LinearGradient(
                    colors: [Color.blue, Color("Color")],
                    startPoint: .topLeading,
                    endPoint: .center
                )
                .cornerRadius(18)
                .ignoresSafeArea()
                
                VStack(spacing: 17) {
                    
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
                    
                    TextField("Phone",
                              text: $phone,
                              prompt: Text("Phone number").foregroundColor(.white)
                    )
                    .font(Font.system(size: 25))
                    
                    .padding(10)
                    
                    .onReceive(Just(phone)) {
                        newValue in
                        let allowedCharacters = "0123456789"
                        let filtered = newValue.filter { allowedCharacters.contains($0) }
                        if filtered != newValue {
                            self.phone = filtered
                        }
                    }
                    
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.white, lineWidth: 1)
                    }
                    HStack {
                        Group {
                            if showPassword {
                                TextField("Password",
                                          // create a secure text field
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
                        cancellable = model.signUp(user: User(name: name, email: email, password: password, phone: phone))
                            .sink(
                                receiveCompletion: { result in
                                    switch result {
                                    case .failure(let error):
                                        signUpResult = .failure(error)
                                        print("Sign-up failed with error: \(error)")
                                    case .finished:
                                        break
                                    }
                                }, receiveValue: { user in
                                    signUpResult = .success(user)
                                    isSignUpSuccessful = true
                                    print("Sign-up successful. User: \(user)")
                                })
                    } label: {
                        Text("Sign Up")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    // make a button fill all the space available horizontaly
                    .background(
                        isSignUpButtonDisabled ?
                        //add a gradient to a button in SwiftUI if the button is disabled
                        LinearGradient(colors: [.indigo], startPoint: .topLeading, endPoint: .bottomTrailing) :
                            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                        
                        
                    )
                    .cornerRadius(22)
                    .disabled(isSignUpButtonDisabled)
                }
                // disable while some condition is applied
                
                .padding()
                
                //navigationlink
                NavigationLink(destination: MypageView(), isActive: $isSignUpSuccessful) {
                    EmptyView()
                }
            }

        }
        .navigationBarBackButtonHidden(false)
        .ignoresSafeArea()

    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}



