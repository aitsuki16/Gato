//
//  PawView.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/04/27.
//

import SwiftUI

struct PawView: View {
    //@State private var scale: CGFloat = 1.0
    @State private var position: CGFloat = 200.0
    
    let animationDuration: Double = 3.0
    
    var body: some View {
        
        VStack(alignment: .center) {
            Image(systemName: "pawprint.fill")
                .foregroundColor(Color("Color"))
                .font(Font.system(size: 50.0))
                            .offset(y: position)
                            .shadow(radius: 10.0)
                            .onTapGesture { position -= 50.0 }
                        .animation(Animation.easeInOut(duration: 2.0), value: position)
        }
    }
}

struct PawView_Previews: PreviewProvider {
    static var previews: some View {
        PawView()
    }
}
