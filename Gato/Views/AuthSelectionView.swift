//
//  signIn.swift
//  Gato
//
//  Created by Ai on 2022/10/31.
//

import SwiftUI

struct AuthSelectionView: View {
    @Binding var isFirstViewActive: Bool
    
    @State var Log : Int? = 0
    @State var Sign: Int? = 0
    var screenSize = UIScreen.main.bounds
    var body: some View {
        
        VStack {
            ZStack {
                //custom background color here
                LinearGradient(
                    colors: [Color("Color-1"), Color("Color-2")],
                    startPoint: .topLeading,
                    endPoint: .center
                )
                .cornerRadius(18)
                .ignoresSafeArea()
                
                VStack(spacing: 100) {
                    SignInImageView()
                    
                    
                    //trying
                    
                    VStack(spacing: 20) {
                        NavigationLink(destination : SignInView(isFirstViewActive: $isFirstViewActive),
                                       tag: 1, selection: $Log) {
                            EmptyView()
                        }
                        Button(action: {
                            self.Log = 1
                            
                            print("Log in button clicked") }) {
                                Text("Sign In")
                                    .foregroundColor(.white)
                                    .font(.system(size: 22))
                            }.frame(width: screenSize.width - 40, height: 50)
                            .background(Color(red: 0.6, green: 0.4, blue: 0.8))
                            .clipShape(RoundedRectangle(cornerRadius :  30))
                        
                        //here
                        NavigationLink(destination : SignUp(isFirstViewActive: $isFirstViewActive),
                                       tag: 1, selection: $Sign) {
                            EmptyView()
                        }
                        Button(action: {
                            self.Sign = 1
                            print("Sign Up button clicked")
                            UserDefaults.standard.set(Log, forKey:"logData")
                        }) {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                        }.frame(width: screenSize.width - 40, height: 50)
                            .background(Color(red: 0.6, green: 0.4, blue: 0.8))
                            .clipShape(RoundedRectangle(cornerRadius :  30))
                        
                        
                    }
                }
                
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
        }
        
    }
}

struct SignSecondView_Previews: PreviewProvider {
    @State static var isFirstViewActive: Bool = false
    
    static var previews: some View {
        AuthSelectionView(isFirstViewActive: $isFirstViewActive)
    }
}
