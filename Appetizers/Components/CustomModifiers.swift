//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 13/10/2023.
//

import SwiftUI

struct StandardButtonStyle : ViewModifier {
    

// this way of creating costum modifiers forces us to user .modifier(standardButtonStyle()) in the view where it is called
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
    
}


// this is another way of creating custom modifiers. We can use it in the view by call .standardButtonSyle on a button
//extension View {
//    func standardButtonStyle() -> some View {
//        self.modifier(StandardButtonStyle())
//    }
//}
