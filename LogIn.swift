//
//  LogIn.swift
//  Gato
//
//  Created by Ai on 2022/11/13.
//

import SwiftUI

struct LogIn: View {
    
    @State var name: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    
    var isSignInButtonDisabled: Bool {
        [name, password].contains(where: \.isEmpty)
    }
    
    var body: some View {
        /*VStack(alignment: .leading, spacing: 15) {
            Spacer()*/
        ZStack {
            //custom background color here
            LinearGradient(
                colors: [Color("Color-1"), Color("Color")],
                startPoint: .trailing,
                            endPoint: .center
                        )
            .cornerRadius(18)
            .ignoresSafeArea()
        
            
            TextField("Name",
                      text: $name ,
                      prompt: Text("Login").foregroundColor(.yellow)
            )
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.pink, lineWidth: 2)
            }
            .padding(.horizontal)

            HStack {
                Group {
                    if showPassword {
                        TextField("Password", // how to create a secure text field
                                    text: $password,
                                    prompt: Text("Password").foregroundColor(.yellow)) // How to change the color of the TextField Placeholder
                    } else {
                        SecureField("Password", // how to create a secure text field
                                    text: $password,
                                    prompt: Text("Password").foregroundColor(.yellow)) // How to change the color of the TextField Placeholder
                    }
                }
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 2) // How to add rounded corner to a TextField and change it colour
                }

               Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.red) // how to change image based in a State variable
                }

            }.padding(.horizontal)

            Spacer()
            

            Button {
                print("do login action")
            } label: {
                Text("Sign In")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity) // how to make a button fill all the space available horizontaly
            .background(
                isSignInButtonDisabled ? // how to add a gradient to a button in SwiftUI if the button is disabled
                LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                    LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(20)
            .disabled(isSignInButtonDisabled) // how to disable while some condition is applied
            .padding()
        }
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
