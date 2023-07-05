//
//  MypageView.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/03/08.
//

import SwiftUI

struct MypageView: View {
    
    @Binding var isFirstViewActive: Bool
    @State private var isClicked = false
    @State private var isShowingAnimation = false
    @State private var animationAmount: CGFloat = 0.8
    @State var showSettings = false
    @State var showSheet = false
    @State private var image = UIImage()
    @State private var selectedImage: UIImage?
    @State var backgroundColor = UserDefaults.standard.colorForKey("BackgroundColor") ?? .white
    @State private var showWallpage = false
    
    let signOutModel = SignOutModel()
    
    var body: some View {
        
        ZStack {
            
            VStack {
                LinearGradient(
                    colors: [Color(""), Color("")],
                    startPoint: .trailing,
                    endPoint: .topLeading
                )
                
                .onAppear {
                    // Retrieve
                    if let imageData = UserDefaults.standard.data(forKey: "SelectedImage") {
                        if let image = UIImage(data: imageData) {
                            self.selectedImage = image
                        }
                    }
                }
                
                VStack {
                    HStack{
                        Button(action: { showSettings = true }) {
                            Text("Setting")
                                .foregroundColor(.indigo)
                            NavigationLink(destination: ColorpickerView()) {
                            }
                            
                        }
                        
                        Spacer()
                            .frame(width: 95)
                        Text("Upload")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(width: 70, height: 35)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.745902535, green: 0.4011192239, blue: 0.7434588389, alpha: 1)), Color(#colorLiteral(red: 0.3841236888, green: 0.2625975893, blue: 0.7434588389, alpha: 1))]), startPoint: .top, endPoint: .bottomLeading))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .sheet(isPresented: $showSheet) {
                                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$selectedImage)
                            }.onTapGesture {
                                showSheet = true
                            }
                        Image(uiImage: selectedImage ?? UIImage())
                            .resizable()
                            .cornerRadius(50)
                            .padding(.all, 6)
                            .frame(width: 120, height: 120)
                            .background(Color.black.opacity(0.2))
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .padding(8)
                    }
                    Spacer()
                        .frame(height: 560)
                }
                
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "pawprint.fill")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                    }
                    
                    Button(action: {
                    }) {
                        Image(systemName: "pawprint.fill")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                        
                    }
                    
                    Button(action: {
                        self.showWallpage = true
                        
                    }) {
                        Image(systemName: "pawprint.fill")
                        Text("Wall")
                        //foregroundColor(.black)
                    }
                    .sheet(isPresented: $showWallpage) {
                        WallpageView()
                        
                        Spacer()
                    }
                    Button(action: {
                        self.isClicked.toggle()
                        signOutModel.signOut()
                        isFirstViewActive = false
                    }) {
                        Text("Sign Out")
                            .foregroundColor(.indigo)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white.opacity(isClicked ?0.2 : 1.0)))
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor)
            .sheet(isPresented: $showSettings) {
                SettingsView(backgroundColor: $backgroundColor)
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        }
        //.padding()
    }
}

struct MypageView_Previews: PreviewProvider {
    @State static var isFirstViewActive: Bool = false
    
    static var previews: some View {
        MypageView(isFirstViewActive: $isFirstViewActive)
    }
}
