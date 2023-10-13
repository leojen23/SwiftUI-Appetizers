//
//  APButton.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 12/10/2023.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
       
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .foregroundColor(.white)
            .buttonStyle(.borderedProminent)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "Test")
}
