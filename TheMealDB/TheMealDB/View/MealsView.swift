//
//  MealsView.swift
//  TheMealDB
//
//  Created by Eduardo Lourenco Pinto Neto on 2021-08-09.
//

import Foundation
import SwiftUI
import Kingfisher

struct MealsView: View {
    @ObservedObject private var model: MealsModel
    private let category: MealCategory
    
    init(category: MealCategory,
         model: MealsModel = .init()) {
        self.category = category
        self.model = model
    }
    
    var body: some View {
        HStack {
            if model.isLoading {
                ProgressView()
            } else {
                List(model.meals) { meal in
                    NavigationLink(destination: MealDetailsView(meal: meal)) {
                        HStack {
                            KFImage(URL(string: meal.thumbnail))
                                .placeholder { ProgressView() }
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text(meal.name)
                        }
                    }
                }
            }
        }
        .onAppear {
            async {
                await model.fetchMeals(from: category)
            }
        }
        .navigationTitle(Text(category.name))
    }
}
