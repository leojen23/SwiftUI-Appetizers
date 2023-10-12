//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 12/10/2023.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @AppStorage("user") private var userData: Data?
    
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            self.alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            self.alertItem = AlertContext.invalidEmailFormat
            return false
        }
        
        return true
    }
    
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            self.alertItem = AlertContext.userSaveSuccess
        } catch {
            self.alertItem = AlertContext.userSavedFailure
        }
    }
    
    
    func retrieveUser() {
        guard let userData = userData else {return}
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            self.alertItem = AlertContext.userSavedFailure
        }
                
    }
}
