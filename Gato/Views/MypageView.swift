//
//  MypageView.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/03/08.
//

import SwiftUI

struct MypageView: View {
    @State private var shouldNavigateBack: Bool = false
    @State private var isClicked = false
    @State private var isShowingAnimation = false
    @State private var animationAmount: CGFloat = 0.8
    @State var showSettings = false
    @State var backgroundColor = Color.black
    //
    @State private var image = UIImage()
    @State private var showSheet = false

    
    let signOutModel = SignOutModel()
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(
                colors: [Color(""), Color("")],
                startPoint: .trailing,
                endPoint: .topLeading
            )
            
            .onAppear {
                if let savedColor = UserDefaults.standard.colorForKey("BackgroundColor") {
                    backgroundColor = savedColor
                    print("Background color loaded: \(backgroundColor)")
                } else {
                    backgroundColor = .white
                }
            }
  
            VStack (alignment: .trailing) {
                Button(action: { showSettings = true }) {
                    Text("Setting")
                    NavigationLink(destination: ColorpickerView()) {
                        
                    }
                   Spacer()

                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor)
            .sheet(isPresented: $showSettings) {
                SettingsView(backgroundColor: $backgroundColor)
            }
            
            .navigationBarTitle("My Page")
            
            HStack {
           
                    Text("Upload")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(width: 100, height: 50)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.262745098, green: 0.0862745098, blue: 0.8588235294, alpha: 1)), Color(#colorLiteral(red: 0.5647058824, green: 0.462745098, blue: 0.9058823529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(16)
                        .foregroundColor(.white)
                .sheet(isPresented: $showSheet) {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }.onTapGesture {
                    showSheet = true
                }
                
                Image(uiImage: self.image)
                        .resizable()
                        .cornerRadius(50)
                        .padding(.all, 4)
                        .frame(width: 100, height: 100)
                        .background(Color.black.opacity(0.2))
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .padding(8)
            }
            
            .padding()
            
            VStack {
                
                PawView()

                Spacer()
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
                    }) {
                        Image(systemName: "pawprint.fill")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                    }
                }
                .padding()
            }
           
            VStack {

                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        
                        self.isClicked.toggle()
                        signOutModel.signOut()
                        shouldNavigateBack = true
                    }) {
                        Text("Sign Out")
                            .foregroundColor(.indigo)
                            .padding(.horizontal, 11)
                            .padding(.vertical, 7)
                            .background(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white.opacity(isClicked ?0.2 : 1.0))
                                })
                    }
                }.padding()
            }
            NavigationLink("",destination: ContentView(),isActive: $shouldNavigateBack).opacity(0)

        }
        .ignoresSafeArea()
        
        .navigationBarBackButtonHidden(true)
        
        
        
    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}
