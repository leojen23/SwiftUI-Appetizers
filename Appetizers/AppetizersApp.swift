//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 11/10/2023.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
