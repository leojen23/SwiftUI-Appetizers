//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 11/10/2023.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.appetizers) { appetizer in
                AppetizerListItem(appetizer: appetizer)
            }.navigationTitle("🌮 Appetizers" )
              
        }
      
    }
}

#Preview {
    AppetizerListView()
}



