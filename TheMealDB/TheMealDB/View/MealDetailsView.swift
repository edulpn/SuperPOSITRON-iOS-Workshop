//
//  MealDetailsView.swift
//  TheMealDB
//
//  Created by Eduardo Lourenco Pinto Neto on 2021-08-09.
//

import Foundation
import SwiftUI
import Kingfisher

struct MealDetailsView: View {
    @ObservedObject private var model: MealDetailsModel
    private let meal: Meal
    
    init(meal: Meal,
         model: MealDetailsModel = .init()) {
        self.meal = meal
        self.model = model
    }
    
    var body: some View {
        ScrollView {
            VStack {
                KFImage(URL(string: meal.thumbnail))
                    .placeholder { ProgressView() }
                    .resizable()
                    .scaledToFit()
                
                if model.isLoading {
                    ProgressView()
                } else {
                    MealDetailsInternalView(mealDetails: model.mealDetails)
                }
            }
        }
        .navigationTitle(Text(meal.name))
        .onAppear {
            async {
                await model.fetchDetails(for: meal)
            }
        }
    }
}

struct MealDetailsInternalView: View {
    private let mealDetails: MealDetails?
    @State private var areIngredientsCollapsed: Bool = false
    @State private var areInstructionsCollapsed: Bool = true
    
    init(mealDetails: MealDetails?) {
        self.mealDetails = mealDetails
    }
    
    var body: some View {
        if let mealDetails = mealDetails {
            VStack(alignment: .center, spacing: 20) {
                MealDetailInternalView(image: Image(systemName: "folder"),
                                       description: Text("Category:")) {
                    Text(mealDetails.category)
                }
                
                MealDetailInternalView(image: Image(systemName: "globe"),
                                       description: Text("Origin:")) {
                    Text(mealDetails.area)
                }
                
                MealDetailInternalView(image: Image(systemName: "tag"),
                                       description: Text("Tags:")) {
                    TagView(tags: mealDetails.tags)
                }
            
                CollapsableHeader(isToggled: $areIngredientsCollapsed, title: "Ingredients")

                if !areIngredientsCollapsed {
                    ForEach(mealDetails.ingredients) { item in
                        HStack(alignment: .center) {
                            Text(item.name)
                                .font(.caption)
                                .frame(alignment: .leading)
                            Text(item.measure)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .frame(alignment: .trailing)
                        }
                    }
                }
                
                CollapsableHeader(isToggled: $areInstructionsCollapsed, title: "Instructions")
                
                if !areInstructionsCollapsed {
                    Text(mealDetails.instructions)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .lineSpacing(1.25)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 20)
                }
            }
            .padding(.top, 20)
        } else {
            Text("Sorry! This meal is missing details!")
                .padding(.top, 20)
        }
    }
}

struct MealDetailInternalView<Content: View>: View {
    private let image: Image
    private let description: Text
    private let detail: Content
    
    init(image: Image, description: Text, @ViewBuilder detail: @escaping () -> Content) {
        self.image = image
        self.description = description
        self.detail = detail()
    }
    
    var body: some View {
        HStack {
            image
                .foregroundColor(.orange)
            description
            detail
                .foregroundColor(.secondary)
        }
    }
}

struct CollapsableHeader: View {
    @Binding var isToggled: Bool
    let title: String
    
    var body: some View {
        Button {
            isToggled = !isToggled
        } label: {
            HStack {
                Text(title)
                    .font(.title)
                Image(systemName: isToggled ? "chevron.down" : "chevron.up")
                    .frame(alignment: .center)
            }
        }
        .padding(.top, 20)
        .foregroundColor(.primary)
    }
}

struct TagView: View {
    struct IdentifiableTag: Identifiable {
        let id = UUID()
        let value: String
        
        init(value: String) {
            self.value = value.lowercased()
        }
    }

    private let identifiableTags: [IdentifiableTag]
    
    init(tags: String) {
        self.identifiableTags = tags
            .split(separator: ",")
            .map(String.init)
            .map(IdentifiableTag.init)
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            ForEach(identifiableTags) { tag in
                Text(tag.value)
                    .font(.custom("Menlo", size: 12))
                    .foregroundColor(.orange)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.orange, lineWidth: 1)
                    )
            }
        }
    }
}
