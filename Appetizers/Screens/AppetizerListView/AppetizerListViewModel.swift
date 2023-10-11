//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 11/10/2023.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    
     func getAppetizers(){
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
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
    
    
    
