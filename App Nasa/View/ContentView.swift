//
//  ContentView.swift
//  App Nasa
//
//  Created by Esteban Aleman on 05/03/24.
//

import SwiftUI

struct ContentView: View {
    @State var photoVM = PhotoViewModel()
        
        var body: some View {
            
                List(photoVM.arrPersonajes) { item in
                    NavigationLink(destination: PhotoDetail(photo: item)) {
                        PhotoRow(photo: item)
                    }
                }
                .navigationTitle("Characters")
                .onAppear {
                    Task {
                        do {
                            try await photoVM.getPersonajesData()
                        } catch {
                            print("Error fetching photos: \(error)")
                        }
                    }
                
            }
        }
   }

   struct ContentView_Previews: PreviewProvider {
       static var previews: some View {
           ContentView()
       }
   }
