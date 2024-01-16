//
//  DetailImageView.swift
//  iChef
//
//  Created by Nathalia Inacio on 16/01/24.
//

import SwiftUI

struct DetailImageView: View {
    let recipeDetail: RecipeDetail?
    @Environment(\.presentationMode) var presentation

    var body: some View {
        ZStack {
            CardImageView(imageURL: URL(string: recipeDetail?.strMealThumb ?? ""))
                .foregroundColor(.gray)
                .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.width)
                .overlay(
                    VStack {
                        
                        HStack {
                            Button(action: {
                                presentation.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(AppTheme.accentColor)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                            })
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Image(systemName: "bookmark.fill")
                                    .foregroundColor(AppTheme.accentColor)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                            })
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 80)
                        
                        Spacer()
                    
                    }
                )
            }
        }
    }