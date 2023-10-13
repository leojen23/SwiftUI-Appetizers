//
//  Appetizer.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 11/10/2023.
//

import Foundation

struct Appetizer: Decodable, Identifiable{
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(
        id: 0001, 
        name: "Test Appetizer",
        description: "This is my description for my appetizer and it is yummy",
        price: 9.99,
        imageURL:"",
        calories: 99,
        protein: 99,
        carbs: 10)
    
    static let orderItemOne = Appetizer(
        id: 0002,
        name: "Order Item 1",
        description: "This is my description for my appetizer and it is yummy",
        price: 9.99,
        imageURL:"",
        calories: 99,
        protein: 99,
        carbs: 10)
    
    static let orderItemTwo = Appetizer(
        id: 0003,
        name: "Order Item 2",
        description: "This is my description for my appetizer and it is yummy",
        price: 9.99,
        imageURL:"",
        calories: 99,
        protein: 99,
        carbs: 10)
    
    static let orderItemThree = Appetizer(
        id: 0001,
        name: "Order Item 3",
        description: "This is my description for my appetizer and it is yummy",
        price: 9.99,
        imageURL:"",
        calories: 99,
        protein: 99,
        carbs: 10)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
