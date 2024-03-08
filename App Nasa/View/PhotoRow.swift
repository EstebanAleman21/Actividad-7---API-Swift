//
//  PhotoRow.swift
//  App Nasa
//
//  Created by Esteban Aleman on 05/03/24.
//

import SwiftUI

struct PhotoRow: View {
    var photo: Personaje
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: photo.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(maxHeight: 295)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 295)
                case .failure(let error):
                   
                    Text("Failed to load image: \(error.localizedDescription)")
                @unknown default:
                    
                    Text("Unknown state")
                }
            }
            .cornerRadius(15) 
            
            VStack(alignment: .leading, spacing: 4) {
                Text(photo.name)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(photo.status)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(3)
            }
        }
        .padding()
        .background(Color.black)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}


#Preview {
    PhotoRow(photo: Personaje(id: 1, name: "Rick Sanchez", status: "Alive", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", species: "Human"))
}
