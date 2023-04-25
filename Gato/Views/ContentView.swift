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
                    
                    .cornerRadius(18)
                    .ignoresSafeArea()
                    
                    //alingment change to the left after...
                    VStack (alignment: .center, spacing: 60) {
                        //text here
                        HStack {
                            Text("Do you want to play with fluffy cats while enjoying drinking delicious and cute drinks?")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(10)
                                .lineLimit(5)
                                .fixedSize(horizontal: false, vertical: true)
                                .shadow(radius: 10)
                            
                            
                        }

                        HStack(alignment: .center) {
                            //here kono
                            ImageFirstView()
                            
                        }
                        
                    }
                }
                
                VStack {
                    Text("Moff Cafe")
                        .font(Font.system(size: 50, weight: .heavy))
                        .multilineTextAlignment(.center)
                        .overlay {
                            LinearGradient(
                                colors: [.pink, .teal, .purple, .blue],
                                startPoint: .bottomTrailing,
                                endPoint: .topLeading
                            )
                            .mask(
                                Text("Moff Cafe")
                                    .font(Font.system(size: 50, weight: .heavy))
                                    .multilineTextAlignment(.center)
                            )
                        }
                    
                    
                }
               
                
                VStack{
                    
                    HStack {
                        
                        Text("Click on the paw to log In or sign In")
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
                    .background(Color(red: 0.8, green: 0.4, blue: 0.8))
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
