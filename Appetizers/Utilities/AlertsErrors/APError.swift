//
//  APError.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 11/10/2023.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case invalidEmailFormat
    case invalidForm
    
}
