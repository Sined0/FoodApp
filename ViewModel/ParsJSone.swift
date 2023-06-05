//
//  ViewModelMovie.swift
//  MovieApp
//
//  Created by Denis Orlenko on 27.02.2023.
//

import Foundation
import CoreData

@MainActor
class JsonParse: ObservableObject {
    
    @Published private (set) var recipe: [Recipe] = []
    
    func fethcData() async throws {
        var request = URLRequest(url: URL(string: "https://food2fork.ca/api/recipe/search/?page=2&query=beef")!)
        request.addValue("Token 9c8b06d329136da358c2d00e76946b0111ce2c48", forHTTPHeaderField: "Authorization")
        let (data, response) = try await URLSession.shared.data(for: request)
        guard(response as? HTTPURLResponse)?.statusCode == 200 else {return print("Error")}
        let video = try JSONDecoder().decode(BookOfRec.self, from: data)
        recipe = video.results
        
        
    }  
}

