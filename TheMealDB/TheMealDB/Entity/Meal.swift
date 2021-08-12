//
//  Meal.swift
//  TheMealDB
//
//  Created by Eduardo Lourenco Pinto Neto on 2021-08-06.
//

import Foundation
import DeveloperToolsSupport

struct Meals: Codable {
    let meals: [Meal]
}

struct Meal: Identifiable, Codable {
    let id: String
    let name: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
}
