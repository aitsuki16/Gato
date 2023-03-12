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
    
    let timer = Timer.publish(every: 2.1, on: .main, in: .common).autoconnect()
    var isSignUpButtonDisabled: Bool {
        [name,email, password,phone].contains(where: \.isEmpty)
    }
    let model = SignUpModel()
    
    var body: some View {
        //added a navigationView "to change"
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
                    /*.shadow(radius: 15)
                     .overlay(Circle().stroke(Color.white, lineWidth: 5))
                     .offset(x: zoom ? -15.0 : 0.0)
                     .background(Circle().foregroundColor(.blue).opacity(zoom ? 0.2 : 0.4))
                     .animation(zoom ? Animation.default.repeatForever(autoreverses: true) : Animation.easeOut(duration: 0.5) )
                     .onReceive(timer) { _ in
                     self.zoom.toggle()
                     }*/
                    //
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
                    
                    //phone textfield
                    TextField("Phone",
                              text: $phone,
                              prompt: Text("Phone number").foregroundColor(.white)
                    )
                    .font(Font.system(size: 25))
                    
                    .padding(10)
                    //allow only numbers
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
                                // change the color of the TextField Placeholder
                            } else {
                                SecureField("Password",
                                            //  create a secure text field
                                            text: $password,
                                            prompt: Text("Password").foregroundColor(.white))
                                // change the color of the TextField Placeholder
                            }
                        }
                        .font(Font.system(size: 23))
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.white, lineWidth: 1)
                            // add rounded corner to a TextField and change it colour
                            
                            HStack {
                                Button {
                                    showPassword.toggle()
                                } label: {
                                    Image(systemName: showPassword ? "pawprint" : "pawprint")
                                        .foregroundColor(.white)
                                    // change image based in a State variable
                                    
                                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                                }.padding()
                            }
                        }.padding(.vertical)
                    }
                    Button {
                        print("do sign Up action")
                        cancellable = model.signUp(user: User(nickname: name, email: email, password: password, phoneNumber: phone))
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
            }
        }
    }
}


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

