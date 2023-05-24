//
//  MypageView.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/03/08.
//

import SwiftUI

struct MypageView: View {
    @Binding var isFirstViewActive: Bool
    
    @State private var isClicked = false
    @State private var isShowingAnimation = false
    @State private var animationAmount: CGFloat = 0.8
    @State var showSettings = false
    @State var backgroundColor = UserDefaults.standard.colorForKey("BackgroundColor") ?? .white
    
    
    let signOutModel = SignOutModel()
    
    var body: some View {
        //NavigationView {
        ZStack {
            LinearGradient(
                colors: [Color("Color-1"), Color("Color")],
                startPoint: .trailing,
                endPoint: .topLeading
            )
            VStack {
                Button(action: { showSettings = true }) {
                    Text("Settings")
                    NavigationLink(destination: ColorpickerView()) {
                        
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor)
            .sheet(isPresented: $showSettings) {
                SettingsView(backgroundColor: $backgroundColor)
            }
            .navigationBarTitle("My Page")
            HStack {
                PawView()
            }
            Spacer()
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
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.isClicked.toggle()
                        signOutModel.signOut()
                        isFirstViewActive = false
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
            Button(action: {
                
            }) {
                
            }
            Spacer()
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct MypageView_Previews: PreviewProvider {
    @State static var isFirstViewActive: Bool = false
    
    static var previews: some View {
        MypageView(isFirstViewActive: $isFirstViewActive)
    }
}
