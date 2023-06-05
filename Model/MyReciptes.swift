//
//  MyRecipte.swift
//  MovieApp
//
//  Created by Denis Orlenko on 07.03.2023.
//

import Foundation
import SwiftUI

struct MyReciptesList: Identifiable {
    
    var id = UUID()
    var title: String
    var ingredients: String
    var selectSectin: String
    var image: Data
    
}
