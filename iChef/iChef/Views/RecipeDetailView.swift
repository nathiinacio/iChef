//
//  RecipeDetailView.swift
//  iChef
//
//  Created by Nathalia Inacio on 13/01/24.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipeTitle: String
    
    var body: some View {
        VStack {
            Text(recipeTitle)
                .font(.title)
                .padding()
            
            Spacer()
        }
        .navigationBarTitle(recipeTitle, displayMode: .inline)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipeTitle: "Apple Frangipan Tart")
    }
}
