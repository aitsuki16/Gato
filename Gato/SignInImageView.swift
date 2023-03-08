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
            Image("kit")
                .clipShape(Circle())
                .shadow(radius: 15)
                .overlay(Circle().stroke(Color.white, lineWidth: 5))
        }
    }
}

struct SignInImageView_Previews: PreviewProvider {
    @State static var ImageKit: Bool = false
    
    static var previews: some View {
        SignInImageView()
    }
}
