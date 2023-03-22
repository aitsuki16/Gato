//
//  ImageView.swift
//  Gato
//
//  Created by Ai on 2023/02/26.
//

import SwiftUI

struct ImageView: View {
    @State private var isAtMaxScale: Bool = false
    private let maxScale: CGFloat = 1.5
    private let animation = Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
    var body: some View {
        ZStack {
            Image("moff")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 130)
            
            
            //try
                .scaleEffect(isAtMaxScale ? maxScale : 1)
                .onAppear {
                    withAnimation(self.animation, {
                        self.isAtMaxScale.toggle()
                    })
                }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    @State static var isAtMaxScale: Bool = false
    static var previews: some View {
        ImageView()
    }
}
