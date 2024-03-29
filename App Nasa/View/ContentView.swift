//
//  ContentView.swift
//  App Nasa
//
//  Created by Esteban Aleman on 05/03/24.
//

import SwiftUI

struct ContentView: View {
    @State var photoVM = PhotoViewModel()
    @State private var searchText = ""
    
    var body: some View {
        TabView {
            NavigationView {
                            List(photoVM.arrPersonajes.filter {
                                searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
                            }) { item in
                                NavigationLink(destination: PhotoDetail(photo: item)) {
                                    PhotoRow(photo: item)
                                }
                            }
                .navigationTitle("Characters")
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Characters")
            }
            
            HomePage()
                .tabItem {
                    Image(systemName: "house.circle")
                    Text("Home")
                }
            SearchView(searchText: $searchText)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
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
