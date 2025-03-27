//
//  JSONDataLoader.swift
//  testSwiftUI
//
//  Created by walid on 20/3/2025.
//

import Foundation

protocol JSONDataLoader {
    func getItems<T: Decodable>(from fileName: String, type: T.Type, isArray: Bool) async throws -> T
}
class JSONDataLoaderImp: JSONDataLoader {
    
    init() {}
    // Fonction générique pour récupérer des données depuis un fichier JSON
    func getItems<T: Decodable>(from fileName: String, type: T.Type, isArray: Bool = true) async throws -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw NSError(domain: "JSONDataLoader", code: 404, userInfo: [NSLocalizedDescriptionKey: "Le fichier \(fileName).json est introuvable."])
        }
        
        let data = try Data(contentsOf: url) 
                let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
