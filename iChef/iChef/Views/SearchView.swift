//
//  SearchView.swift
//  iChef
//
//  Created by Nathalia Inacio on 15/01/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    @ObservedObject var searchViewModel = SearchViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center, spacing: 0) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                    .padding()
                    .scaledToFill()
                    .frame(width: 50, height: 50, alignment: .center)

                Text("Explore")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }

            HStack {
                TextField("Type the name of the recipe...", text: $searchText, onEditingChanged: { isEditing in
                    isSearching = false
                }, onCommit: {
                    searchViewModel.recipes = []
                    searchViewModel.searchRecipe(recipe: searchText)
                    searchViewModel.isLoading = true
                    isSearching = true
                })
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)

                Button(action: {
                    if !searchText.isEmpty {
                        searchViewModel.recipes = []
                        searchViewModel.searchRecipe(recipe: searchText)
                        searchViewModel.isLoading = true
                        isSearching = true
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.white)
                        .padding()
                        .background(AppTheme.accentColor)
                        .clipShape(Circle())
                })
            }

            if isSearching {
                showResults()
            }

            Spacer()
        }
        .onDisappear{
            isSearching = false
        }
        .padding(.horizontal, 16)
        .navigationBarHidden(true)
    }

    @ViewBuilder
    func showResults() -> some View {
        if !searchViewModel.recipes.isEmpty {
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(searchViewModel.recipes, id: \.idMeal) { recipe in
                    NavigationLink(
                        destination: RecipeDetailView(recipeID: recipe.idMeal),
                        label: {
                            CardView(title: recipe.strMeal, recipeImageURL: URL(string: recipe.strMealThumb ?? ""))
                        })
                }
            }
        } else {
            if searchViewModel.isLoading == false {
                Text("No results.")
                    .padding()
                    .foregroundColor(.gray)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: AppTheme.accentColor))
                    .scaleEffect(1.5)
                    .padding(.top, 50)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

