//
//  OrderView.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 11/10/2023.
//

import SwiftUI

struct OrderView: View {
    
    
    @State private var orderItems = MockData.orderItems
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems){ appetizer in
                            AppetizerListItem(appetizer: appetizer)
                        }.onDelete(perform: deleteItems)
                        
                    }.listStyle(.plain)
                    Button(action: {
                        print("order place")
                    }, label: {
                        APButton(title: "$99.99 - Place order")
                    })
                    .padding(.bottom,25)
                }
                
                if  orderItems.isEmpty {
                    EmptyState(imageName: "empty-order", message: " you have no orders in you cart.\n Please start adding somes")
                }
            }
            .navigationTitle("✌️ Orders")
        }
    }
    
    func deleteItems (offSets: IndexSet) {
        orderItems.remove(atOffsets: offSets)
    }
}

#Preview {
    OrderView()
}
    
