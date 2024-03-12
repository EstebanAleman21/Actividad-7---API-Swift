//
//  HomePage.swift
//  App Nasa
//
//  Created by Esteban Aleman on 05/03/24.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("BackgroundImage")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(Color.black.opacity(0.3))

                VStack(spacing: 20) {
                    Text("Welcome Rick & Morty fans")
                        .font(.custom("YourFontFamily", size: 40, relativeTo: .title))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 1.5, x: 0, y: 1.5)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.7))
                                .shadow(color: .white, radius: 2, x: 0, y: 2)
                        )

                    Text("Get involved in the fantastic world!")
                        .font(.custom("YourFontFamily", size: 20, relativeTo: .body))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        
                        

                    NavigationLink(destination: ExploreView()) {
                        Text("Start Exploring")
                            .font(.custom("YourFontFamily", size: 20, relativeTo: .headline))
                            .fontWeight(.semibold)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(15)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.accentColor.opacity(0.2))
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                    )
                }
                .padding()
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


