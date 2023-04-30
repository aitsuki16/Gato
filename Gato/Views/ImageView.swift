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
            Image(systemName:"pawprint.fill")
                .resizable()
                        //.scaledToFit()
                        .frame(width: 80, height: 80)
            
            //try
                .scaleEffect(isAtMaxScale ? maxScale : 1)
                .onAppear {
                    withAnimation(self.animation, {
                        self.isAtMaxScale.toggle()
                    })
                }
        }
        .navigationBarBackButtonHidden(true)

    }
}

struct ImageView_Previews: PreviewProvider {
    @State static var isAtMaxScale: Bool = false
    static var previews: some View {
        ImageView()
    }
}
