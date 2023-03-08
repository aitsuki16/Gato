//
//  MypageView.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/03/08.
//

import SwiftUI

struct MypageView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                
                
                ZStack {
                    
                    //custom background color here
                    LinearGradient(
                        colors: [Color("Color-1"), Color("Color")],
                        startPoint: .trailing,
                        endPoint: .bottomLeading
                    )
                    .ignoresSafeArea()    }
            }
        }
    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}
