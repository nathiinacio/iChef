//
//  MealDBManager.swift
//  iChef
//
//  Created by Nathalia Inacio on 13/01/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
}

class MealDBManager {
    static let shared = MealDBManager()
    private let baseURL = "https://www.themealdb.com/api/json/v1/1/"

    func fetchIngredients(completion: @escaping (Result<[Ingredient], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)list.php?i=list") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            guard let data = data else {
                debugPrint("No data received.")
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let result = try JSONDecoder().decode(IngredientAPIResponse.self, from: data)
                completion(.success(result.meals))
            } catch {
                debugPrint("Error decoding data: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }.resume()
    }


    func fetchRecipes(selectedIngredient: String, completion: @escaping (Result<[Recipe], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)filter.php?i=\(selectedIngredient)") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            guard let data = data else {
                debugPrint("No data received.")
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let result = try JSONDecoder().decode(RecipeAPIResponse.self, from: data)
                completion(.success(result.meals))
            } catch {
                debugPrint("Error decoding data: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchRecipeDetail(selectedRecipe: String, completion: @escaping (Result<[RecipeDetail], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)lookup.php?i=\(selectedRecipe)") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            guard let data = data else {
                debugPrint("No data received.")
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let result = try JSONDecoder().decode(RecipeDetailAPIResponse.self, from: data)
                completion(.success(result.meals))
            } catch {
                debugPrint("Error decoding data: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }.resume()
    }
}
