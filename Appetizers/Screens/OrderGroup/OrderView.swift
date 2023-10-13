//
//  OrderView.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 11/10/2023.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items){ appetizer in
                            AppetizerListItem(appetizer: appetizer)
                        }.onDelete(perform: order.delete)
                        
                    }.listStyle(.plain)
                    Button(action: {
                        print("order place")
                    }, label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place order")
                    })
                    .padding(.bottom,25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: " you have no orders in you cart.\n Please start adding somes")
                }
            }
            .navigationTitle("✌️ Orders")
        }
    }
    
    
}

#Preview {
    OrderView().environmentObject(Order())
}
    
