//
//  IngredientsListView.swift
//  iChef
//
//  Created by Nathalia Inacio on 13/01/24.
//

import SwiftUI

struct IngredientsListView: View {
    @ObservedObject private var ingredientViewModel = IngredientViewModel()
    @State private var selectedIngredient: String?

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            LogoComponentView()
                .padding(.bottom, 32)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: true) {
                if ingredientViewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: AppTheme.accentColor))
                        .scaleEffect(1.5)
                        .padding(.top, 50)
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    Text("Select your main ingredient and see \nthe recipes that you could do")
                        .font(.system(size: 18, weight: .light))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                        .padding(.vertical, 8)
                    VStack {
                        ForEach(ingredientViewModel.ingredients, id: \.idIngredient) { ingredient in
                            NavigationLink(
                                destination: RecipesListView(recipeViewModel: RecipeViewModel(selectedIngredient: ingredient.strIngredient)),
                                label: {
                                    CardView(title: ingredient.strIngredient, recipeImageURL: nil)
                                })
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
    }
}


struct IngredientsListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsListView()
    }
}

