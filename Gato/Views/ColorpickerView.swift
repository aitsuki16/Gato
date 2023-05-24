//
//  ColorpickerView.swift
//  Gato
//
//  Created by user on 2023/05/12.
//

import SwiftUI

struct ColorpickerView: View {
    @State private var selectedColor: Color = .white
    
    var body: some View {
        VStack {
            Text("Choose color")
                .navigationBarTitle("Background Color")
            
            ColorPicker("Color", selection: $selectedColor)
                .padding()
            
            Image(systemName: "pawprint.fill") // Replace with your desired image name
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .foregroundColor(selectedColor)
                           .frame(width: 100, height: 100)
        }
        
    }
}
struct ColorpickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorpickerView()
    }
}
