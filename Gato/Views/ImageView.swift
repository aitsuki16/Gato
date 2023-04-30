//
//  ImageView.swift
//  Gato
//
//  Created by Ai on 2023/02/26.
//

import SwiftUI

struct ImageView: View {
    @State private var isAtMaxScale: Bool = false
//    private let maxScale: CGFloat = 0.5
//    private let animation = Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)
    var body: some View {
        ZStack {
            
            //try
            VStack {
                Text("GaTo")
                    .font(Font.system(size: 70, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .overlay {
                        LinearGradient(
                            colors: [.pink, .teal, .purple, .blue],
                            startPoint: .bottomTrailing,
                            endPoint: .topLeading
                        )
                        .mask(
                            Text("GaTo")
                                .font(Font.system(size: 70, weight: .heavy))
                                .multilineTextAlignment(.center)
                        )
                    }
                
                
            }

            .opacity(isAtMaxScale ? 1.0 : 0.3)
                        .animation(Animation.easeInOut(duration: 2.0).repeatForever())
                        .onAppear {
                            self.isAtMaxScale = true
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
