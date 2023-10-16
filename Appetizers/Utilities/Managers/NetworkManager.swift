//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 11/10/2023.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL = baseURL + "appetizers"
    
    private init() {}
    
    
    func getAppetizers() async throws -> [Appetizer] {
        
        guard let url = URL(string: appetizersURL) else {
            throw APError.invalidURL
        }
        
        let (data, _ ) = try await URLSession.shared.data(from: url) // Return a tuple : Data or an error
//        let (data, reponse ) = try await URLSession.shared.data(from: url) // we can use the response to handle specific error code if needed
       
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                return decodedResponse.request
            } catch {
                throw APError.invalidData
            }
        }

    // OLD WAY OF DOING NETWORK CALLS ======================================================================
    
//    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void){
//        guard let url = URL(string: appetizersURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            
//            if let _ = error  {
//                completed(.failure(.unableToComplete))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                completed(.success(decodedResponse.request))
//            } catch {
//                completed(.failure(.invalidData))
//            }
//        }
//        task.resume()
//    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void){
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
    
}
