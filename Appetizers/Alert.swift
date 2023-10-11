//
//  Alert.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 11/10/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    static let invalidData = AlertItem(title: Text("Server Error"), message: 
                                        Text("The data received from the server was invalid"), dismissButton: .default(Text("Ok")))
    
    
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalide Response from the server. Please try again later"), dismissButton:.default(Text("Ok")))
                                           
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("There was an issue. if this persists contact support"), dismissButton: .default(Text("Ok")))
                                      
    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Please check your internet connexion"), dismissButton: .default(Text("Ok")))
    
}


