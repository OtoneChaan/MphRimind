//
//  AddReminderView.swift
//  MPH_Reimind
//
//  Created by 高橋涼太 on 2024/08/07.
//

import SwiftUI

struct AddReminderView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var dueDate = Date()
    var viewModel: ReminderViewModel
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationTitle("Add Reminder")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                viewModel.addReminder(title: title, dueDate: dueDate)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

