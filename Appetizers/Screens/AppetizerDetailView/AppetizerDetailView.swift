//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 12/10/2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        
        VStack {
            
            AppetizerRemotImage(urlString : appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack (spacing: 45) {
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            
            Spacer()
            
            
            Button {
                order.add(appetizer)
                isShowingDetailView = false
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to cart")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 30)
        .overlay(Button(action: {
            isShowingDetailView = false
        }, label: {
            XDimissButton()
        }), alignment: .topTrailing)
        
        
    }
}


struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack (spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetailView: .constant(true)).environmentObject(Order())
}
