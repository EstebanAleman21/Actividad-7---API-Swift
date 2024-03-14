//
//  SearchView.swift
//  App Nasa
//
//  Created by Esteban Aleman on 13/03/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    @State var photoVM = PhotoViewModel()
    
    var body: some View {
        VStack {
            TextField("Search characters", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            
            List(photoVM.arrPersonajes.filter {
                searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
            }) { item in
                NavigationLink(destination: PhotoDetail(photo: item)) {
                    PhotoRow(photo: item)
                }
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






