//
//  ContentView.swift
//  iChef
//
//  Created by Nathalia Inacio on 13/01/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State var activeTab: TabBar = .recipes
    @Namespace private var animation
    
    var body: some View {
        NavigationView{
            VStack {
                TabView(selection: $activeTab, content: {
                    IngredientsListView()
                          .tag(TabBar.recipes)
                    RecipesListView(recipeViewModel: RecipeViewModel(selectedIngredient: "salmon"))
                        .tag(TabBar.meals)
                    Text("Favorites")
                        .tag(TabBar.favorites)
                })
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                CustomizeTabBar()
            }
            .padding(.vertical, 8)
            .ignoresSafeArea()
        }
        .navigationViewStyle(DefaultNavigationViewStyle())
    }
    
    
    
    @ViewBuilder
    func CustomizeTabBar(_ tint: Color = AppTheme.accentColor, _ inactiveTint: Color = .gray) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(TabBar.allCases, id: \.rawValue) { item in
                TabItem(activeTint: tint, inactiveTint: inactiveTint, tab: item, animation: animation, currentTab: $activeTab)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.7), value: activeTab)
        .background{
            Rectangle()
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .padding(.top, 25)
        }
    }
}

public enum TabBar: String, CaseIterable {
    case recipes = "Recipes"
    case meals = "Meals"
    case favorites = "Favorites"
    
    var tabIcon:String {
        switch self {
        case .recipes:
            return "book"
        case .meals:
            return "calendar"
        case .favorites:
            return "bookmark"
        }
    }
    
    var index:Int {
        return TabBar.allCases.firstIndex(of: self) ?? 0
    }
}

struct TabItem: View {
    var activeTint: Color
    var inactiveTint: Color
    var tab: TabBar
    var animation: Namespace.ID
    
    @Binding var currentTab:TabBar
    
    var body: some View {
        VStack {
            Image(systemName: tab.tabIcon)
                .font(.title2)
                .foregroundColor(currentTab == tab ? .white : inactiveTint)
                .frame(width: currentTab == tab ? 58 : 35, height: currentTab == tab ? 58 : 35)
                .background(
                    ZStack {
                        if currentTab == tab {
                            Circle()
                                .fill(AppTheme.accentColor)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        } else {
                            Color.clear
                        }
                    }
                )
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(currentTab == tab ? activeTint : inactiveTint)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            currentTab = tab
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
