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
        Image("kono")
            .clipShape(Circle())
            .shadow(radius: 15)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
        }
    }
}

struct ImageFirstView_Previews: PreviewProvider {
static var previews: some View {
    
    ImageFirstView()
    }
}
