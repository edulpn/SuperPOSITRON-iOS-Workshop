//
//  MealsModel.swift
//  TheMealDB
//
//  Created by Eduardo Lourenco Pinto Neto on 2021-08-09.
//

import Foundation

class MealsModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var isLoading: Bool = true
    private let service: MealServiceType
    
    init(service: MealServiceType = MealService()) {
        self.service = service
    }
    
    func fetchMeals(from category: MealCategory) async {
        isLoading = true
        guard let meals = try? await service.fetchMeals(from: category) else {
            isLoading = false
            return
        }
        isLoading = false
        
        self.meals = meals
    }
}
