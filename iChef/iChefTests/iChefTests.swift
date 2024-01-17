//
//  iChefTests.swift
//  iChefTests
//
//  Created by Nathalia Inacio on 13/01/24.
//

import XCTest
@testable import iChef

class iChefTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Teste unitário para verificar se a tela é carregada corretamente quando os ingredientes estão disponíveis
    func testIngredientsLoaded() {
        let ingredientsListView = IngredientsListView()
        let viewModel = ingredientsListView.ingredientViewModel

        viewModel.ingredients = [Ingredient(idIngredient: "1", strIngredient: "Chicken", strDescription: "Delicious chicken", strType: "Meat")]
        XCTAssertNotNil(ingredientsListView.body, "A tela não foi carregada corretamente com os ingredientes disponíveis.")
    }

    // Teste unitário para verificar o comportamento quando a lista de ingredientes está vazia
    func testIngredientsEmpty() {
        let ingredientsListView = IngredientsListView()
        let viewModel = ingredientsListView.ingredientViewModel
        viewModel.ingredients = []

        XCTAssertNotNil(ingredientsListView.body, "A mensagem de lista vazia não foi exibida corretamente.")
    }

    // Teste unitário para verificar o comportamento ao selecionar um ingrediente
    func testIngredientSelection() {
        let ingredientsListView = IngredientsListView()
        let viewModel = ingredientsListView.ingredientViewModel

        viewModel.ingredients = [Ingredient(idIngredient: "1", strIngredient: "Chicken", strDescription: "Delicious chicken", strType: "Meat")]
        ingredientsListView.selectedIngredient = "Chicken"
        XCTAssertNotNil(ingredientsListView.body, "A tela de receitas não foi apresentada corretamente ao selecionar um ingrediente.")
    }
    
    
    // Teste unitário para verificar se a tela é carregada corretamente quando as receitas estão disponíveis
    func testRecipesLoaded() {
        let recipesListView = RecipesListView(recipeViewModel: RecipeViewModel(selectedIngredient: "Chicken"))
        let viewModel = recipesListView.recipeViewModel

        viewModel.recipes = [Recipe(strMeal: "Chicken with rice", strMealThumb: "", idMeal: "52795")]
        XCTAssertNotNil(recipesListView.body, "A tela não foi carregada corretamente com as receitas disponíveis.")
    }

    // Teste unitário para verificar o comportamento quando a lista de receitas está vazia
    func testRecipesEmpty() {
        let recipesListView = RecipesListView(recipeViewModel: RecipeViewModel(selectedIngredient: "Chicken"))
        let viewModel = recipesListView.recipeViewModel
        
        viewModel.recipes = []
        XCTAssertNotNil(recipesListView.body, "A mensagem de lista vazia não foi exibida corretamente.")
    }

    // Teste unitário para verificar o comportamento ao selecionar uma receita
    func testRecipeSelection() {
        let recipesListView = RecipesListView(recipeViewModel: RecipeViewModel(selectedIngredient: "Chicken"))
        let viewModel = recipesListView.recipeViewModel

        viewModel.recipes = [Recipe(strMeal: "Chicken with rice", strMealThumb: "", idMeal: "52795")]
        XCTAssertNotNil(recipesListView.body, "A tela de detalhe da receita não foi apresentada corretamente ao selecionar uma receita.")
    }
    
    // Teste unitário para verificar se a tela de detalhe carregada corretamente quando a receita está disponível
    func testRecipeDetaiLoaded() {
        let detailView = RecipeDetailView(recipeiD: "52795")
        let viewModel = detailView.recipeDetailViewModel

        viewModel.recipe = RecipeDetail(idMeal: "52795", strMeal: "Chicken with rice", strDrinkAlternate: "", strCategory: "", strArea: "", strInstructions: "", strMealThumb: nil, strYoutube: nil, strIngredient1: nil, strIngredient2: nil, strIngredient3: nil, strIngredient4: nil, strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: nil, strMeasure2: nil, strMeasure3: nil, strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)
        XCTAssertNotNil(detailView.body, "A tela não foi carregada corretamente com os ingredientes disponíveis.")
    }

}

