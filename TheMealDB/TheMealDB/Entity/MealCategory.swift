//
//  MealCategory.swift
//  TheMealDB
//
//  Created by Eduardo Lourenco Pinto Neto on 2021-08-09.
//

import Foundation

struct MealCategories: Codable {
    let categories: [MealCategory]
}

struct MealCategory: Identifiable, Codable {
    let id: String
    let name: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnail = "strCategoryThumb"
    }
}
