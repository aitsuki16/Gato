//
//  SettingsView.swift
//  Gato
//
//  Created by user on 2023/05/12.
//

import SwiftUI

struct SettingsView: View {
    @Binding var backgroundColor: Color
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            ColorPicker("Choose a color", selection: $backgroundColor)
                .padding()
            
            Button("Save") {
                UserDefaults.standard.setColor(backgroundColor, forKey: "BackgroundColor")
                print("Background color: \(backgroundColor)")
                
                // Saved color binding
                backgroundColor = UserDefaults.standard.colorForKey("BackgroundColor") ?? .white
                
                // Dismiss
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

extension UserDefaults {
    func setColor(_ color: Color, forKey key: String) {
        if let rgbColor = UIColor(color).cgColor.components {
            set(rgbColor, forKey: key)
        }
    }
    
    func colorForKey(_ key: String) -> Color? {
        guard let rgbColor = array(forKey: key) as? [CGFloat] else { return nil }
        let color = Color(.sRGB, red: Double(rgbColor[0]), green: Double(rgbColor[1]), blue: Double(rgbColor[2]), opacity: Double(rgbColor[3]))
        return color
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(backgroundColor: .constant(Color.white))
    }
}
