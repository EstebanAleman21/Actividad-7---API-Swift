//
//  ExploreView.swift
//  App Nasa
//
//  Created by Esteban Aleman on 12/03/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var contentViewIsActive = false
    
    var body: some View {
        VStack {
            Text("Explore")
                .font(.system(size: 70))
                .fontWeight(.bold)
                .shadow(radius: 20)
            
            Button(action: {
                contentViewIsActive = true
            }) {
                Text("Rick & Morty")
                    .font(.custom("YourFontFamily", size: 40))
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
            }
            .padding(.bottom, 40)
            .fullScreenCover(isPresented: $contentViewIsActive) {
                ContentView()
            }
            
            Text("Coming Soon")
                .font(.custom("YourFontFamily", size: 40, relativeTo: .headline))
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(15)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
