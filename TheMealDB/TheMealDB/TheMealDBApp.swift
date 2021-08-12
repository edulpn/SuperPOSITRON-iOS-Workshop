//
//  TheMealDBApp.swift
//  TheMealDB
//
//  Created by Eduardo Lourenco Pinto Neto on 2021-08-06.
//

import SwiftUI

@main
struct TheMealDBApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MealCategoriesView()
            }
        }
    }
}
