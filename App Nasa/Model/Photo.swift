//
//  Photo.swift
//  App Nasa
//
//  Created by Esteban Aleman on 05/03/24.
//

import Foundation

struct Resultado_API : Codable {
    var results : [Personaje]
}

struct Personaje : Codable, Identifiable {
    var id : Int
    var name : String
    var status : String
    var gender : String
    var image : String
    var species: String
    
    enum CodingKeys : String, CodingKey{
        case id
        case name
        case status
        case gender
        case image
        case species

    }
}

