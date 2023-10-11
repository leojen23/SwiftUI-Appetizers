//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 11/10/2023.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL = baseURL + "appetizers"
    
    private init() {}
    
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void){
        guard let url = URL(string: appetizersURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let _ = error else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: <#T##Data#>)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
            
           
            
        }
        task.resume()
    }
    
}
