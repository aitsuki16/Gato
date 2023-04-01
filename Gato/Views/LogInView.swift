//
//  LogIn.swift
//  Gato
//
//  Created by Ai on 2022/11/13.
//

import SwiftUI

struct LogInView: View {
    
    @State var isAtMaxScale = false
    @State var name: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    @State private var joke: String = ""
    
    
    var isSignInButtonDisabled: Bool {
        [name, password].contains(where: \.isEmpty)
    }
    

    var body: some View {
        //added a navigationView "to change"
        
        NavigationView {
            ZStack {
                
                //custom background color here
                LinearGradient(
                    colors: [Color("Color-1"), Color("Color")],
                    startPoint: .trailing,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                
                //added some alingment
                VStack(spacing: 1) {
                    //added same image
                    
                    Spacer()
                    
                    ZStack {
                        //paws
                        Geometric()
                        
                        ImageView()
                    }.frame(height: 195)
                    
                    Spacer()
                    
                    TextField("Name",
                              text: $name ,
                              prompt: Text("Login").foregroundColor(.gray)
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
                                          // how to create a secure text field
                                          text: $password,
                                          prompt: Text("Password").foregroundColor(.white)) // How to change the color of the TextField Placeholder
                            } else {
                                SecureField("Password",
                                            // how to create a secure text field
                                            text: $password,
                                            prompt: Text("Password").foregroundColor(.white))
                                // How to change the color of the TextField Placeholder
                            }
                        }
                        .font(Font.system(size: 23))
                        
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.white, lineWidth: 0.5)
                            // How to add rounded corner to a TextField and change it colour
                            
                            HStack {
                                Button {
                                    showPassword.toggle()
                                } label: {
                                    Image(systemName: showPassword ? "pawprint" : "pawprint")
                                        .foregroundColor(.white)
                                    // how to change image based in a State variable
                                    
                                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                                    
                                    
                                    
                                }.padding()
                            }
                        }.padding(.vertical)
                    }
                    Button {
                        print("do login action")
                    } label: {
                        Text("LogIn")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity) // how to make a button fill all the space available horizontaly
                    .background(
                        isSignInButtonDisabled ? // how to add a gradient to a button in SwiftUI if the button is disabled
                        LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                        
                        
                    )
                    .cornerRadius(22)
                    .disabled(isSignInButtonDisabled)
                }
                .padding()
            }
        }
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
          
    }
}
