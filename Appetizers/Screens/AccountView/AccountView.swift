//
//  AccountView.swift
//  Appetizers
//
//  Created by Olivier Guillemot on 11/10/2023.
//

import SwiftUI

struct AccountView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthDate = Date()
    @State private var extraNapkins = false
    @State private var frequentRefills = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("E-mail", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $birthDate, displayedComponents: .date)
                    Button(action: {
                        print("Save")
                    }, label: {
                        Text("Save Settings")
                    })
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                    Toggle("Frequent Refills", isOn: $frequentRefills)
                }.toggleStyle(SwitchToggleStyle(tint: Color.brandPrimary))
            }
            .navigationTitle("😉 Account")
        }
    }
}

#Preview {
    AccountView()
}
