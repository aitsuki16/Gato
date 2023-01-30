//
//  SignUp.swift
//  Gato
//
//  Created by Ai on 2022/11/26.
//

import SwiftUI
import Combine

struct SignUp: View {
    //tryin
    @State var zoom = false
    @State var isAtMaxScale = false

    @State var nickname: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var comfirmPassword = ""
    @State var showPassword: Bool = false
    @State var phoneNumber: String = ""
   
    let timer = Timer.publish(every: 2.1, on: .main, in: .common).autoconnect()
    var isSignUpButtonDisabled: Bool {
        [email, password,phoneNumber].contains(where: \.isEmpty)
    }
    
    //added to try
    private let animation = Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
     private let maxScale: CGFloat = 2
  
    var body: some View {
        //added a navigationView "to change"
        NavigationView {

            ZStack {
                //custom background color here
                LinearGradient(
                    colors: [Color("Color-1"), Color("Color")],
                    startPoint: .trailing,
                    endPoint: .center
                )
                .cornerRadius(18)
                .ignoresSafeArea()
                
                VStack(spacing: 17) {
                   
                    ZStack {
                        Image("moff")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 130)
                            
                            
                        //try
                            .scaleEffect(isAtMaxScale ? maxScale : 1)
                                        .onAppear {
                                            withAnimation(self.animation, {
                                                self.isAtMaxScale.toggle()
                                            })
                                    }
                    }
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
                    
                    TextField("Nick",
                              text: $nickname ,
                              prompt: Text("Nick Name").foregroundColor(.gray)
                        
                    )
                    .font(Font.system(size: 25))

                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.white, lineWidth: 1)
                    }
                    
                    TextField("Email",
                              text: $email ,
                              prompt: Text("Email").foregroundColor(.gray)
                    )
                    .font(Font.system(size: 25))

                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.white, lineWidth: 1)
                    }
                           
                        //phone textfield
                    TextField("Phone",
                                  text: $phoneNumber,
                                  prompt: Text("Phone number").foregroundColor(.gray)
                        )
                        .font(Font.system(size: 25))

                        .padding(10)
                    //allow only numbers
                        .onReceive(Just(phoneNumber)) {
                            newValue in
                            let allowedCharacters = "0123456789"
                            let filtered = newValue.filter { allowedCharacters.contains($0) }
                            if filtered != newValue {
                                self.phoneNumber = filtered
                            }
                        }

                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.white, lineWidth: 1)
                                
                        
                    
                        
                            
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
                                .stroke(.white, lineWidth: 1) // How to add rounded corner to a TextField and change it colour
                            
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


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
