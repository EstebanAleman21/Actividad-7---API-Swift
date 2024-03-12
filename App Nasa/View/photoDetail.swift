//
//  photoDetail.swift
//  App Nasa
//
//  Created by Esteban Aleman on 05/03/24.
//

import SwiftUI

struct PhotoDetail: View {
    var photo: Personaje
        
        var body: some View {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: photo.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    case .failure(let error):
                        Text("Failed to load image: \(error.localizedDescription)")
                    @unknown default:
                        Text("Unknown state")
                    }
                }
                .frame(maxHeight: 300)

                
                
                .padding(.horizontal)
                
            }
            VStack {
                ScrollView {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Status:")
                                .font(.title)
                                .foregroundColor(.black)
                            
                            Text(photo.status)
                                .font(.title)
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            Text("Species:")
                                .font(.title)
                                .foregroundColor(.black)
                            
                            Text(photo.species)
                                .font(.title)
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            Text("Gender:")
                                .font(.title)
                                .foregroundColor(.black)
                            
                            Text(photo.gender)
                                .font(.title)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle(photo.name)
            }



        }
}

#Preview {
    PhotoDetail(photo: Personaje(id: 1, name: "Rick Sanchez", status: "Alive", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", species: "Human"))
}
