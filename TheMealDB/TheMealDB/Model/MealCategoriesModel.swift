//
//  MealCategoriesModel.swift
//  TheMealDB
//
//  Created by Eduardo Lourenco Pinto Neto on 2021-08-06.
//

import Foundation

class MealCategoriesModel: ObservableObject {
    @Published var categories: [MealCategory] = []
    @Published var isLoading: Bool = true
    private let service: MealServiceType
    
    init(service: MealServiceType = MealService()) {
        self.service = service
    }
    
    func fetch() async {
        isLoading = true
        guard let categories = try? await service.fetchMealCategories() else {
            isLoading = false
            return
        }
        isLoading = false
        self.categories = categories
    }
}
