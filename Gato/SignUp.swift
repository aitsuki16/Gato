//
//  SignUp.swift
//  Gato
//
//  Created by Ai on 2022/11/26.
//

import SwiftUI

struct SignUp: View {
    //tryin

    @State var nickname: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var comfirmPassword = ""
    @State var showPassword: Bool = false
    @State var phoneNumber: String = ""
    
    var isSignUpButtonDisabled: Bool {
        [email, password,phoneNumber,].contains(where: \.isEmpty)
    }
    
    var body: some View {
        //added a navigationView "to change"
        NavigationView {

            VStack {

            ZStack {
                
                    //custom background color here
                    LinearGradient(
                        colors: [Color("Color-1"), Color("Color")],
                        startPoint: .trailing,
                        endPoint: .bottomTrailing
                                )
                    .ignoresSafeArea()
                
                //try paws
         
                
                //Spacer()
        
            //added some alingment just in case
                VStack {
                    
                    //
                    TextField("Nick",
                              text: $nickname ,
                              prompt: Text("Nick Name").foregroundColor(.gray)
                        
                    )
                    .font(Font.system(size: 25))

                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.white, lineWidth: 0.5)
                    }
                    
                    TextField("Email",
                              text: $email ,
                              prompt: Text("Email").foregroundColor(.gray)
                    )
                    .font(Font.system(size: 25))

                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.white, lineWidth: 0.5)
                    }
                           
                        //phone textfield
                    TextField("Phone",
                                  text: $phoneNumber,
                                  prompt: Text("Phone number").foregroundColor(.gray)
                        )
                        .font(Font.system(size: 25))

                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.white, lineWidth: 0.5)
                        
                    
                        
                            
                    }
                        
                        
                        
                       // .padding(.vertical)

                    HStack {
                        Group {
                            if showPassword {
                                TextField("Password", // how to create a secure text field
                                            text: $password,
                                            prompt: Text("Password").foregroundColor(.white)) // How to change the color of the TextField Placeholder
                            } else {
                                SecureField("Password", // how to create a secure text field
                                            text: $password,
                                            prompt: Text("Password").foregroundColor(.white)) // How to change the color of the TextField Placeholder
                            }
                        }
                        .font(Font.system(size: 23))

                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.white, lineWidth: 0.5) // How to add rounded corner to a TextField and change it colour
                            
                            HStack {
                                Button {
                                     showPassword.toggle()
                                 } label: {
                                     Image(systemName: showPassword ? "pawprint" : "pawprint")
                                         .foregroundColor(.white) // how to change image based in a State variable
                                     
                                     .frame(maxWidth: .infinity, alignment: .topTrailing)

                                     

                                 }.padding()
                            }
                            
                            
                        }.padding(.vertical)
                    }
                            Button {
                            print("do sign Up action")
                        } label: {
                            Text("Sign Up")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .frame(height: 50)
                        .frame(maxWidth: .infinity) // how to make a button fill all the space available horizontaly
                       .background(
                            isSignUpButtonDisabled ? // how to add a gradient to a button in SwiftUI if the button is disabled
                            LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                            
                            
                        )
                        .cornerRadius(22)
                    .disabled(isSignUpButtonDisabled)
                }
                // how to disable while some condition is applied
                    
                    //
                    
                    
                
                .padding()
            }
        }
            
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
