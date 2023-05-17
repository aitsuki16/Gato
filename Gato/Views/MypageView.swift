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
    @State private var animationAmount: CGFloat = 0.8
    //@State var backgroundColor = Color.white
    @State var showSettings = false
    @State var backgroundColor = Color.white
    
    
    init() {
        if let savedColor = UserDefaults.standard.colorForKey("BackgroundColor") {
            backgroundColor = savedColor
            print("Background color loaded: \(backgroundColor)")
        } else {
            backgroundColor = .white
        }
    }
    
    
    let signOutModel = SignOutModel()
    
    var body: some View {
        
        //NavigationView {
        ZStack {
            
            LinearGradient(
                colors: [Color("Color-1"), Color("Color")],
                startPoint: .trailing,
                endPoint: .topLeading
            )
            
            
            
            //
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
                
                //                    Button(action: {
                //                    }) {
                //                        Image(systemName: "pawprint.fill")
                //                            .font(.system(size: 24))
                //                            .foregroundColor(.white)
                //                            .padding()
                //                            .background(Color.black)
                //                            .cornerRadius(16)
                //
                //                        Text("My account")
                //                            .fontWeight(.bold)
                //                            .foregroundColor(.white)
                //                            .padding(EdgeInsets(top: 10, leading: 16, bottom: 8, trailing: 16))
                //                            .background(Color.indigo)
                //                            .cornerRadius(8)
                //                    }
            }
            .padding()
            VStack {
//                
//                //NavigationLink(destination: ColorPickerView()) {
//                //Text("Change Background Color")
//                //
//}
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
            Button(action: {
                
            }) {
                
            }
            Spacer()
        }
        .ignoresSafeArea()
        //            .navigationBarBackButtonHidden(true)
        //            .onAppear {
        //                self.isShowingAnimation.toggle()
        //            }
        //}
        .navigationBarBackButtonHidden(true)
        
        
        
    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}
