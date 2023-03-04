//
//  Geometric.swift
//  Gato
//
//  Created by Ai on 2023/03/03.
//

import SwiftUI

struct Geometric: View {
    
//    @Binding var geometric: Bool
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 5) {
                Image(systemName: "pawprint")
                    .font(.system(size: 40 ))
                    .frame(width: 0)
                
                Image(systemName: "pawprint").foregroundColor(.black)
                    .font(.system(size: 30 ))
                    .frame(width: 50, height: 40 )
                Image(systemName: "pawprint")
                    .font(.system(size :  30 ))
                    .frame(width :  60, height: 40 )
                Image(systemName: "pawprint")
                    .font(.system(size : 30 ))
                    .frame(width :  50, height: 50)
            }
        }
    }
}

struct Geometric_Previews: PreviewProvider {
//    @State static var geometric: Bool = false

    static var previews: some View {
        Gato.Geometric()
    }
}
