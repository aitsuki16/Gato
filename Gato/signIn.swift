//
//  signIn.swift
//  Gato
//
//  Created by Ai on 2022/10/31.
//

import SwiftUI

struct signIn: View {
    
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
                Image("kit")
                    .clipShape(Circle())
                .shadow(radius: 15)
                .overlay(Circle().stroke(Color.white, lineWidth: 5))
                
                VStack(spacing: 20) {
                    Button(action: {
                        print("Log in button clicked") }) {
                            Text("Log In")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                        }.frame(width: screenSize.width - 40, height: 50)
                        .background(Color(red: 0.6, green: 0.4, blue: 0.8))
                        .clipShape(RoundedRectangle(cornerRadius :  30))
                    
                    Button(action: {
                        print("Sign Up button clicked") }) {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                        }.frame(width: screenSize.width - 40, height: 50)
                        .background(Color(red: 0.6, green: 0.4, blue: 0.8))
                        .clipShape(RoundedRectangle(cornerRadius :  30))
                }
                Spacer()
            }.padding(.top, 50)
        }
    }
}

struct signIn_Previews: PreviewProvider {
    static var previews: some View {
        signIn()
    }
}
