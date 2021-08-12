//
//  MealDetails.swift
//  TheMealDB
//
//  Created by Eduardo Lourenco Pinto Neto on 2021-08-10.
//

import Foundation

struct MealDetailsResponse: Codable {
    let meals: [MealDetails]
}

struct MealDetails: Identifiable, Codable {
    let id: String
    let name: String
    let thumbnail: String
    let category: String
    let area: String
    let tags: String
    let instructions: String
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let ingredient11: String?
    let ingredient12: String?
    let ingredient13: String?
    let ingredient14: String?
    let ingredient15: String?
    let ingredient16: String?
    let ingredient17: String?
    let ingredient18: String?
    let ingredient19: String?
    let ingredient20: String?
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    let measure11: String?
    let measure12: String?
    let measure13: String?
    let measure14: String?
    let measure15: String?
    let measure16: String?
    let measure17: String?
    let measure18: String?
    let measure19: String?
    let measure20: String?
    
    struct IdentifiableIngredient: Identifiable {
        let id = UUID()
        let name: String
        let measure: String
    }
    
    var ingredients: [IdentifiableIngredient] {
        return [
            (ingredient1, measure1),
            (ingredient2, measure2),
            (ingredient3, measure3),
            (ingredient4, measure4),
            (ingredient5, measure5),
            (ingredient6, measure6),
            (ingredient7, measure7),
            (ingredient8, measure8),
            (ingredient9, measure9),
            (ingredient10, measure10),
            (ingredient11, measure11),
            (ingredient12, measure12),
            (ingredient13, measure13),
            (ingredient14, measure14),
            (ingredient15, measure15),
            (ingredient16, measure16),
            (ingredient17, measure17),
            (ingredient18, measure18),
            (ingredient19, measure19),
            (ingredient20, measure20),
        ].compactMap {
            guard let name = $0.0, let measure = $0.1, !name.isEmpty, !measure.isEmpty else {
                return nil
            }
            return IdentifiableIngredient(name: name, measure: measure)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case category = "strCategory"
        case area = "strArea"
        case tags = "strTags"
        case instructions = "strInstructions"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
    }
}
