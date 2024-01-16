//
//  RecipeInformationView.swift
//  iChef
//
//  Created by Nathalia Inacio on 16/01/24.
//


import SwiftUI

struct RecipeInformationView: View {
    let recipeDetail: RecipeDetail?
    @Environment(\.presentationMode) var presentation
    
    var ingredients: [String] {
        return getIngredientsAndMeasures(recipe: recipeDetail).0
     }
    
    var measures: [String] {
        return getIngredientsAndMeasures(recipe: recipeDetail).1
     }
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 8) {
                
                Text(recipeDetail?.strMeal ?? "")
                .font(.system(size: 23, weight: .bold))
                .padding(.vertical, 16)
                .lineLimit(1)
                
            HStack(alignment: .center, spacing: 4) {
                Text(recipeDetail?.strCategory ?? "")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .textCase(.uppercase)
                    .foregroundColor(AppTheme.tertiaryColor)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .background(AppTheme.primaryColor)
                    .cornerRadius(30)

                VStack {
                    Divider()
                }
                
                Spacer()
                
                Text("\(ingredients.count) ingredients")
                    .foregroundColor(.gray)
                    .minimumScaleFactor(0.01)

                }
            }
            .padding(.horizontal, 16)
            .background(Color.white)
            
            Divider()
                .padding([.horizontal, .vertical])
            
            VStack {
                HStack {
                    Text("Ingredients")
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("Measures")
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                .padding(.horizontal, 30)
                
                ForEach(ingredients.indices, id: \.self) { index in
                    VStack {
                        HStack {
                            Text(ingredients[index].lowercased())
                                .fontWeight(.light)
                            Spacer()
                            Text(measures[index].lowercased())
                                .fontWeight(.bold)
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal)
                }
                .frame(width: UIScreen.main.bounds.width - 30, height: 70)
                .padding(.horizontal)
                
                Divider()
                    .padding([.horizontal, .vertical])

                VStack(alignment: .leading, spacing: 8) {
                    Text("Instructions")
                        .foregroundColor(.gray)
                    

                    Text(recipeDetail?.strInstructions ?? "")
                        .fontWeight(.light)
                        .padding(.horizontal, 30)
                        .padding(.vertical)
                }
                    
                if recipeDetail?.strYoutube != nil, recipeDetail?.strYoutube?.isEmpty != true {
                    VStack {
                        Text("Cook it with the video")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)

                        VideoComponentView(videoURL: recipeDetail?.strYoutube ?? "", detailImageURL: recipeDetail?.strMealThumb ?? "")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 120) // Ajuste o tamanho conforme necessário
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                    }
                }
                
                
            }
            .background(Color.white)
        }
        .cornerRadius(30)
        .offset(y: -30)
    }
}
                
func getIngredientsAndMeasures(recipe: RecipeDetail?) -> ([String], [String]) {
    var ingredients: [String] = []
    var measures: [String] = []

    for i in 0..<20 {
        if let ingredient = recipe?["strIngredient\(i)"], !ingredient.isEmpty {
            ingredients.append(ingredient)
        }
        
        if let measure = recipe?["strMeasure\(i)"], !measure.isEmpty {
            measures.append(measure)
        }
    }
    return (ingredients, measures)
}
