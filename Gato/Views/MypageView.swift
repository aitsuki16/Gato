//
//  MypageView.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/03/08.
//

import SwiftUI

struct MypageView: View {
    @State private var shouldNavigateBack: Bool = false
    let signOutModel = SignOutModel()
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                LinearGradient(
                    colors: [Color("Color-1"), Color("Color")],
                    startPoint: .trailing,
                    endPoint: .topLeading
                )
                .ignoresSafeArea(.all)
                
                Spacer()
                
                //
                
                
                VStack(alignment: .leading) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "pawprint")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(16)
                        
                        
                        
                        HStack {
                            Text("Reserve")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(EdgeInsets(top: 10, leading: 16, bottom: 8, trailing: 16))
                        .background(Color.indigo)
                        .cornerRadius(8)
                    }
                    //
                    Button(action: {
                        
                    }) {
                        Image(systemName: "pawprint")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(16)
                        HStack {
                            Text("Points")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(EdgeInsets(top: 10, leading: 16, bottom: 8, trailing: 16))
                        .background(Color.indigo)
                        .cornerRadius(8)
                    }
                    
                    //
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "pawprint")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(16)
                        HStack {
                            Text("My account")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(EdgeInsets(top: 10, leading: 16, bottom: 8, trailing: 16))
                        .background(Color.indigo)
                        .cornerRadius(8)
                    }
                    
                    ZStack {
                        VStack(alignment: .center) {
                            Button(action: {
                                signOutModel.signOut()
                                shouldNavigateBack = true
                            }) {
                                Text("Sign Out")
                                
                                Image(systemName: "pawprint")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.indigo)
                                    .cornerRadius(16)
                            }
                        }
                        .onChange(of: shouldNavigateBack) { shouldNavigate in
                                    if shouldNavigate {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            shouldNavigateBack = false
                                        }
                                    }
                                }
                                .background(NavigationLink("", destination: ContentView(), isActive: $shouldNavigateBack).opacity(0))
                    }
                    
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            
        }
        Spacer()
    }
    
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}
