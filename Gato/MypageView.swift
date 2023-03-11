//
//  MypageView.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/03/08.
//

import SwiftUI

struct MypageView: View {
    var screenSize = UIScreen.main.bounds

    var body: some View {
        
        
        VStack {
            ZStack {
                LinearGradient(
                    colors: [Color("Color-1"), Color("Color")],
                    startPoint: .trailing,
                    endPoint: .topLeading
                )
                .ignoresSafeArea()
                .scaledToFill()
                
                VStack() {
                    Button(action: {
                        // action to perform when button is tapped
                    }) {
                        HStack {
                            Image("paw")
                                .resizable()
                                .frame(width: 20, height: 20)
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
                        // action to perform when button is tapped
                    }) {
                        HStack {
                            Image("paw")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("Points")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(EdgeInsets(top: 10, leading: 16, bottom: 8, trailing: 16))
                        .background(Color.indigo)
                        .cornerRadius(8)
                        .frame(width: screenSize.width - 40, height: 50)
                    }
                    
                    //
                    
                    Button(action: {
                        // action to perform when button is tapped
                    }) {
                        HStack {
                            Image("paw")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("My account")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(EdgeInsets(top: 10, leading: 16, bottom: 8, trailing: 16))
                        .background(Color.indigo)
                        .cornerRadius(8)
                    }
                }
            }
            .padding()
            .ignoresSafeArea()
            }
    }
    
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}
