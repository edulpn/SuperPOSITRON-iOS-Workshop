//
//  MealCategoriesView.swift
//  TheMealDB
//
//  Created by Eduardo Lourenco Pinto Neto on 2021-08-06.
//

import SwiftUI
import Kingfisher

struct MealCategoriesView: View {
    @ObservedObject var model: MealCategoriesModel
    
    init(model: MealCategoriesModel = .init()) {
        self.model = model
    }
    
    var body: some View {
        HStack {
            if model.isLoading {
                ProgressView()
            } else {
                List(model.categories) { category in
                    NavigationLink(destination: MealsView(category: category)) {
                        HStack {
                            KFImage(URL(string: category.thumbnail))
                                .placeholder { ProgressView() }
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text(category.name)
                        }
                    }
                }
            }
        }
        .navigationTitle("Meal Categories")
        .onAppear {
            async {
                await model.fetch()
            }
        }
    }
}

struct MealCategoriesView_Previews: PreviewProvider {
    class MealServiceStub: MealServiceType {
        func fetchMealCategories() async throws -> [MealCategory] {
            return [
                MealCategory(id: "some",
                             name: "My Category",
                             thumbnail: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"),
                MealCategory(id: "someOther",
                             name: "Some other category",
                             thumbnail: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"),
                MealCategory(id: "yetAnother",
                             name: "Other",
                             thumbnail: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg")
            ]
        }
        
        func fetchDetails(for meal: Meal) async throws -> MealDetails? {
            return nil
        }
        
        func fetchMeals(from category: MealCategory) async throws -> [Meal] {
            return []
        }
    }
    
    static var previews: some View {
        NavigationView {
            MealCategoriesView(
                model: MealCategoriesModel(
                    service: MealServiceStub()
                )
            )
        }
    }
}
