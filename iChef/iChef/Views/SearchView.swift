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
                TextField("Search for recipes", text: $searchText, onEditingChanged: { isEditing in
                    isSearching = true
                }, onCommit: {
                    searchViewModel.searchRecipe(recipe: searchText)
                })
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                Button(action: {
                    isSearching = false
                    if !searchText.isEmpty{
                        searchViewModel.searchRecipe(recipe: searchText)
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                })
            }
            

            if !searchText.isEmpty && !isSearching {
                Text("Search results for '\(searchText)':")
                    .font(.system(size: 18, weight: .light))
                    .padding(.vertical, 8)

                ForEach(searchViewModel.recipes, id: \.idMeal) { recipe in
                    NavigationLink(
                        destination: RecipeDetailView(recipeiD: recipe.idMeal),
                        label: {
                            CardView(title: recipe.strMeal, recipeImageURL: URL(string: recipe.strMealThumb ?? ""))
                        })
                }
            }

            Divider()
                .padding(.bottom, 8)
        }
        .padding(.horizontal, 16)
        .navigationBarHidden(true)
    }
}
