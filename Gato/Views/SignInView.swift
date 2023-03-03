//
//  signIn.swift
//  Gato
//
//  Created by Ai on 2022/10/31.
//

import SwiftUI

struct SignInView: View {
    @State var Log : Int? = 0
    @State var Sign: Int? = 0
    @State var ImageKit = false

    var screenSize = UIScreen.main.bounds
    var body: some View {

            ZStack {
                //custom background color here
                LinearGradient(
                    colors: [Color("Color-1"), Color("Color")],
                    startPoint: .trailing,
                    endPoint: .center
                )
                .cornerRadius(18)
                .ignoresSafeArea()
                
                VStack(spacing: 150) {
                    //image here
                    SignInImageView(ImageKit: $ImageKit)

                    
                    //trying
                    
                    VStack(spacing: 20) {
                        NavigationLink(destination : LogInView(),
                                       tag: 1, selection: $Log) {
                            EmptyView()
                            
                        }
                        Button(action: {
                            self.Log = 1
                            
                            print("Log in button clicked") }) {
                                Text("Log In")
                                    .foregroundColor(.white)
                                    .font(.system(size: 22))
                            }.frame(width: screenSize.width - 40, height: 50)
                            .background(Color(red: 0.6, green: 0.4, blue: 0.8))
                            .clipShape(RoundedRectangle(cornerRadius :  30))
                        
                        //here
                        NavigationLink(destination : SignUp(),
                                       tag: 1, selection: $Sign) {
                            EmptyView()
                        }
                        Button(action: {
                            self.Sign = 1
                            print("Sign Up button clicked") }) {
                                Text("Sign Up")
                                    .foregroundColor(.white)
                                    .font(.system(size: 22))
                            }.frame(width: screenSize.width - 40, height: 50)
                            .background(Color(red: 0.6, green: 0.4, blue: 0.8))
                            .clipShape(RoundedRectangle(cornerRadius :  30))
                    }
                }
            }
            //Spacer()
            .ignoresSafeArea()
        }
        

}

struct SigInview_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
