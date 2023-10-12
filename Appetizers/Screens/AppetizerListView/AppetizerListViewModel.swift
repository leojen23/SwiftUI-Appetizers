//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 11/10/2023.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetailView: Bool = false
    
     func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                    
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                    
                }
            }
        }
    }
}
    
//    var selectedFramework: Framework? {
//        didSet{isShowingDetailView = true}
//    }
//    @Published var isShowingDetailView: Bool = false
//    
//    let columns: [GridItem] = [GridItem(.flexible()),
//                               GridItem(.flexible()),
//                               GridItem(.flexible())]
    
    
    
