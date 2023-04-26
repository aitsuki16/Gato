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
        
            Image("Mycat1")
                .resizable()
                        .scaledToFill()
                        .frame(width: 450, height: 260)
                        .clipShape(Circle())
                
        }
    }
}

struct ImageFirstView_Previews: PreviewProvider {
    static var previews: some View {
        
        ImageFirstView()
    }
}
