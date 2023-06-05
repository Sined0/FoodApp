//
//  ModelMovie.swift
//  MovieApp
//
//  Created by Denis Orlenko on 27.02.2023.
//

import Foundation
import SwiftUI


struct BookOfRec: Decodable {
    let results: [Recipe]
}

struct Recipe: Identifiable, Decodable{
    var id: Int
    var title: String
    var rating: Int
    var ingredients: [String]
    var featured_image: URL

    private enum CodingKeys: String, CodingKey {
        case id = "pk"
        case title = "title"
        case rating = "rating"
        case ingredients
        case featured_image = "featured_image"
    }
}
