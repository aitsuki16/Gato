//
//  PawView.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/04/27.
//

import SwiftUI

struct PawView: View {
    @State private var scale: CGFloat = 1.0
    @State private var position: CGPoint = .zero
    
    let animationDuration: Double = 3.0
    
    var body: some View {
        Image(systemName: "pawprint.fill")
            .resizable()
            .foregroundColor(.indigo)
            .scaleEffect(scale)
            .offset(x: position.x, y: position.y) // Use `position.x` and `position.y`
            .animation(
                Animation.easeOut(duration: animationDuration)
                    .repeatForever(autoreverses: true)
            )
            .onAppear {
                self.scale = CGFloat.random(in: 0.5...1.5)
                self.position = CGPoint(
                    x: CGFloat.random(in: 0..<UIScreen.main.bounds.width),
                    y: CGFloat.random(in: 0..<UIScreen.main.bounds.height)
                )
            }
    }
}

struct PawView_Previews: PreviewProvider {
    static var previews: some View {
        PawView()
    }
}
