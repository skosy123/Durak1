//
//  ContentView.swift
//  DurakTrying
//
//  Created by Sofya-Anastasia Skosyreva on 11/14/24.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                NavigationLink("Start", destination: StartGameView())
            }
            .padding()
        }
    }
}


struct StartGameView: View {
    @State private var imageOpacity: Double = 1.0
    let deck = ["AH", "KH","QH", "JH","10H", "9H","8H", "7H", "6H", "5H","4H", "3H","2H"]
    @State private var currentImageName: String = "KH"
    var body: some View {
        VStack (alignment: .leading, spacing: 2){
            Image("CardBack")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 150)
                .opacity(imageOpacity)
                .animation(.easeInOut(duration: 1), value: imageOpacity)
            
            if imageOpacity == 0 {
                Image(currentImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 150)
                    .transition(.opacity)
            }
            
            Button("Deal") {
                withAnimation {
                    imageOpacity = 0
                }
                currentImageName = deck.randomElement() ?? "CardBack"
            }
            .padding()
        }
        .padding()
    }
}

    
    
    
    #Preview {
        ContentView()
    }
    

