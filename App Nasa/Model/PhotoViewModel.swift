//
//  PhotoViewModel.swift
//  App Nasa
//
//  Created by Esteban Aleman on 05/03/24.
//

import Foundation

@Observable
class PhotoViewModel {
    var arrPersonajes = [Personaje]()
    
    init(){
        Task{
            do {
                try await getPersonajesData()
                print("salio de funcion")
            }
            catch {
                print("error al cargar datos de la API")
            }
            
        }
        
    }
    

    
    func getPersonajesData() async throws{
        
        //1. Obtener el objeto URL
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else{
            print("invalid url")
            return
        }
        
        
        
        //2. preparar el Request a la pagina http con la URL
        let urlRequest = URLRequest(url: url)
        
        //3. Realizar la llama con URLSession
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("error")
            return
        }
        
        //4. Decodificar la informacion de formato JSON
        let results = try JSONDecoder().decode(Resultado_API.self, from: data)
        
        print(results)
        
        //5. utilizamos el thread principal para actualizar la variable de Photos.
        DispatchQueue.main.async{
            self.arrPersonajes = results.results
        }
        
    }
    
}
