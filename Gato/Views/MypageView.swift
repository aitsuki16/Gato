//
//  MypageView.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/03/08.
//

import SwiftUI

struct MypageView: View {
    @State private var shouldNavigateBack: Bool = false
    @State private var isClicked = false
    @State private var isShowingAnimation = false
    
    let signOutModel = SignOutModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [Color("Color-1"), Color("Color")],
                    startPoint: .trailing,
                    endPoint: .topLeading
                )
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            // Action for first button
                        }) {
                            Image(systemName: "pawprint.fill")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 50, height: 50)
                        }
                        
                        Button(action: {
                            // Action for second button
                        }) {
                            Image(systemName: "pawprint.fill")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 50, height: 50)
                            
                        }
                        
                        Button(action: {
                            // Action for third button
                        }) {
                            Image(systemName: "pawprint.fill")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 50, height: 50)
                        }
                    }
                    .padding()
                }
                VStack {
                    
                    Button(action: {
                    }) {
                        Image(systemName: "pawprint.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(16)
                        
                        Text("My account")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 10, leading: 16, bottom: 8, trailing: 16))
                            .background(Color.indigo)
                            .cornerRadius(8)
                    }
                }
                .padding()
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            
                            self.isClicked.toggle()
                            signOutModel.signOut()
                            shouldNavigateBack = true
                        }) {
                            Text("Sign Out")
                                .foregroundColor(.indigo)
                                .padding(.horizontal, 11)
                                .padding(.vertical, 7)
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.white.opacity(isClicked ?0.2 : 1.0))
                                    })
                        }
                    }.padding()
                }
                NavigationLink("",destination: ContentView(),isActive: $shouldNavigateBack).opacity(0)
                               
                
                if isShowingAnimation {
                    PawView()
                        .frame(width: 50, height: 50)
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .onAppear {
                self.isShowingAnimation.toggle()
            }
            
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}
