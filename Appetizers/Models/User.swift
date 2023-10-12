//
//  User.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 12/10/2023.
//

import Foundation

// User conforms to Codable to be able to convert to type litterals

struct User: Codable{
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
