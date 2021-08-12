//
//  MealDetailsModel.swift
//  TheMealDB
//
//  Created by Eduardo Lourenco Pinto Neto on 2021-08-10.
//

import Foundation

class MealDetailsModel: ObservableObject {
    @Published var mealDetails: MealDetails?
    @Published var isLoading: Bool = true
    private let service: MealServiceType
    
    init(service: MealServiceType = MealService()) {
        self.service = service
    }
    
    func fetchDetails(for meal: Meal) async {
        isLoading = true
        guard let mealDetails = try? await service.fetchDetails(for: meal) else {
            isLoading = false
            return
        }
        isLoading = false
        
        self.mealDetails = mealDetails
    }
}
