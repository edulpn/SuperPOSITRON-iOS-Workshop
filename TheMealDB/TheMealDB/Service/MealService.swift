//
//  MealService.swift
//  TheMealDB
//
//  Created by Eduardo Lourenco Pinto Neto on 2021-08-12.
//

import Foundation

protocol MealServiceType {
    func fetchMealCategories() async throws -> [MealCategory]
    func fetchMeals(from category: MealCategory) async throws -> [Meal]
    func fetchDetails(for meal: Meal) async throws -> MealDetails?
}

class MealService: MealServiceType {
    private let session: URLSession = .shared
    
    func fetchDetails(for meal: Meal) async throws -> MealDetails? {
        let (data, _) = try await session.data(from: URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(meal.id)")!)
        let details = try JSONDecoder().decode(MealDetailsResponse.self, from: data)
        return details.meals.first
    }
    
    func fetchMealCategories() async throws -> [MealCategory] {
        let (data, _) = try await session.data(from: URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!)
        let categories = try JSONDecoder().decode(MealCategories.self, from: data)
        return categories.categories
    }
    
    func fetchMeals(from category: MealCategory) async throws -> [Meal] {
        let (data, _) = try await session.data(from: URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category.name)")!)
        let categories = try JSONDecoder().decode(Meals.self, from: data)
        return categories.meals
    }
}
