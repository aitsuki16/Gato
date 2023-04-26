//
//  ImageFirstView.swift
//  Gato
//
//  Created by Ai on 2023/03/03.
//

import SwiftUI

struct ImageFirstView: View {
    
    var body: some View {
        VStack {
            
            Image("catIcon1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .foregroundColor(Color.white)
                .background(Color.yellow)
                .clipShape(Circle())
                .shadow(radius: 20)
                .overlay(Circle().stroke(Color.yellow, lineWidth: 5))
                
        }
    }
}

struct ImageFirstView_Previews: PreviewProvider {
    static var previews: some View {
        
        ImageFirstView()
    }
}
