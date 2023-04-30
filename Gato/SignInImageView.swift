//
//  SignInImageView.swift
//  Gato
//
//  Created by Ai on 2023/03/03.
//

import SwiftUI

struct SignInImageView: View {
    
    var body: some View {
        ZStack {
            Image("Mycat5")
                .resizable()
                .frame(width: 250, height: 250)

                .clipShape(Circle())
                //.scaledToFit()

                .shadow(radius: 15)
                .overlay(Circle().stroke(Color.indigo, lineWidth: 5))

        }
    }
}

struct SignInImageView_Previews: PreviewProvider {
    @State static var ImageKit: Bool = false
    
    static var previews: some View {
        SignInImageView()
    }
}
