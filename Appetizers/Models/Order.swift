//
//  Order.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 13/10/2023.
//

import SwiftUI


final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    func delete (offSets: IndexSet) {
        items.remove(atOffsets: offSets)
    }
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price}
    }
    
}



