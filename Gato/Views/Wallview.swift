//
//  Wallview.swift
//  Gato
//
//  Created by user on 2023/06/21.
//

import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
struct Wallview: View {
    @State var selectedItem: PhotosPickerItem?

    var body: some View {
//
//       PhotosPicker(selection: $selectedItem) {
//           Label("Fetch Photos", systemImage: "photo.fill.on.rectangle.fill")
//       }
//       .buttonStyle(.plain)
//       .foregroundColor(.indigo)
        NavigationView {
                  GeometryReader { geometry in
                      List {
                              ScrollView(.horizontal, showsIndicators: false) {
                                  HStack {
                                      Text("Story 1")
                                      Text("Story 2")
                                      Text("Story 3")
                                      Text("Story 4")
                                      Text("Story 5")
                                  }
                              }
                              VStack(alignment: .leading, spacing: 8) {
                                  HStack(spacing: 8) {
                                      Image("profile")
                                          .resizable()
                                          .clipShape(Circle())
                                          .frame(width: 50, height: 50)
                                      Text("userName").font(.headline)
                                  }.padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                                  Image("postImage")
                                      .resizable()
                                      .scaledToFill()
                                      .frame(width: geometry.size.width, height: 250)
                                      .clipped()
                                  Text("text here...")
                                      .lineLimit(nil)
                                      .font(.system(size: 15))
                                      .padding(.leading, 16).padding(.trailing, 16).padding(.bottom, 16)
                              }.listRowInsets(EdgeInsets())
                          }.navigationBarTitle(Text("GaTo"), displayMode: .inline)
                              .navigationBarItems(leading: Button(action: {
                                  print("click camera...")
                              }, label: {
                                  Image("camera")
                                      .renderingMode(.original)
                                      .resizable()
                                      .scaledToFit()
                                      .frame(width: 24, height: 24)
                              }), trailing: Button(action: {
                                  print("click send message...")
                              }, label: {
                                  Image("send")
                                      .renderingMode(.original)
                                      .resizable()
                                      .scaledToFit()
                                      .frame(width: 24, height: 24)
                              }))
                      }
              }
        
    }
}

struct Wallview_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            Wallview()
        } else {
            // Fallback on earlier versions
        }
    }
}
