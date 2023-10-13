//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 11/10/2023.
//

import SwiftUI

// Main Actor =  anything related to UI will be re-routed to the main Thread - we don t need to do it manually anymore -

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
     func getAppetizers(){
        isLoading = true
         
         // Wrapp in task to put it in async context ----------------------------------
         Task {
             do {
                 appetizers = try await NetworkManager.shared.getAppetizers()
                 isLoading = false
             } catch {
                 
                 if let apError = error as? APError {
                     switch apError {
                         case .invalidData:
                             alertItem = AlertContext.invalidData
                             
                         case .invalidURL:
                             alertItem = AlertContext.invalidURL
                             
                         case .invalidResponse:
                             alertItem = AlertContext.invalidResponse
                             
                         case .unableToComplete:
                             alertItem = AlertContext.unableToComplete
                        }
                     } else {
                         alertItem = AlertContext.unableToComplete // meant to be a generic error message that is not implemented
                     }
                 isLoading = false

             }
         }
         
      }
    
//    func getAppetizers(){
//       isLoading = true
//       NetworkManager.shared.getAppetizers { result in
//           DispatchQueue.main.async {
//               self.isLoading = false
//               switch result {
//                   
//               case .success(let appetizers):
//                   self.appetizers = appetizers
//                   
//               case .failure(let error):
//                   switch error {
//                       
//                   case .invalidData:
//                       self.alertItem = AlertContext.invalidData
//                       
//                   case .invalidURL:
//                       self.alertItem = AlertContext.invalidURL
//                       
//                   case .invalidResponse:
//                       self.alertItem = AlertContext.invalidResponse
//                       
//                   case .unableToComplete:
//                       self.alertItem = AlertContext.unableToComplete
//                       
//                   case .invalidEmailFormat:
//                       self.alertItem = AlertContext.invalidEmailFormat
//                       
//                   case .invalidForm:
//                       self.alertItem = AlertContext.invalidEmailFormat
//                   }
//               }
//                   
//               }
//           }
//       }
    }

    
    
    
