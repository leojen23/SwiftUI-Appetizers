//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 12/10/2023.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
   
   @Published var firstName = ""
   @Published var lastName = ""
   @Published var email = ""
   @Published var birthDate = Date()
   @Published var extraNapkins = false
   @Published var frequentRefills = false

    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            self.alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            self.alertItem = AlertContext.invalidEmailFormat
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        print("changes have been changed successfully")
    }
    
    
}
