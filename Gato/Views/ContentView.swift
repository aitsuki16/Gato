//
//  ContentView.swift
//  Gato
//
//  Created by Ai on 2022/10/21.
//
import SwiftUI

struct ContentView : View {
    @State var page : Int? = 0
    @State var ImageKono: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 60) {
                ZStack {
                    LinearGradient(
                        colors: [Color("Color-1"), Color("Color")],
                        startPoint: .trailing,
                        endPoint: .center
                    )
                    
                    .cornerRadius(70)
                    .ignoresSafeArea()
                
                    //alingment change to the left after...
                    VStack (alignment: .center, spacing: 60) {
                        //text here
                        Spacer()
                        HStack {
                            Text("Welcome To GaTo")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Color-1"))
                                .padding(10)
                                .fixedSize(horizontal: false, vertical: true)
                                .shadow(radius: 1)
                                .opacity(5)
                            
                            
                        }

                        HStack(alignment: .center) {
                            //here kono
                            ImageFirstView()
                            
                        }
                        
                    }
                }
                
                VStack {
                    Text("GaTo")
                        .font(Font.system(size: 50, weight: .heavy))
                        .multilineTextAlignment(.center)
                        .overlay {
                            LinearGradient(
                                colors: [.pink, .teal, .purple, .blue],
                                startPoint: .bottomTrailing,
                                endPoint: .topLeading
                            )
                            .mask(
                                Text("GaTo")
                                    .font(Font.system(size: 50, weight: .heavy))
                                    .multilineTextAlignment(.center)
                            )
                        }
                    
                    
                }
               
                
                VStack{
                    
                    HStack {
                        
                        Text("Click on the paw to log Up or sign In")
                            .font(.caption)
                            .foregroundColor(.indigo)
                            .padding()
                    }
                    
                    NavigationLink(destination : AuthSelectionView(),
                                   tag: 1, selection: $page) {
                        EmptyView()
                        
                    }
                    
                    Button(action: {
                        self.page = 1
                    }) {
                        
                        Image("paw")
                    }
                    .padding(3)
                    .background(Color(red: 0.8, green: 0.5, blue: 0.8))
                    .clipShape(RoundedRectangle(cornerRadius :  80))
                }
                Spacer()
                
            }

        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()

    } 
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View { ContentView()
    }
}
