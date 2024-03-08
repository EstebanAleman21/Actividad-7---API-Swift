//
//  HomePage.swift
//  App Nasa
//
//  Created by Esteban Aleman on 05/03/24.
//

import SwiftUI

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("BackgroundImage")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(1)
                
                VStack {
                    Text("Welcome Rick & Morty fans")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    Text("Get involved in the fantastic world")
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Start Exploring")
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                .foregroundColor(.white)
            }
            .navigationTitle("Home")
            .navigationBarHidden(true)
        }
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

