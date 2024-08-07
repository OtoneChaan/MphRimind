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
                TextField("タイトル", text: $title)
                DatePicker("通知日", selection: $dueDate, displayedComponents: .date)
            }
            .navigationTitle("予定を追加")
            .navigationBarItems(leading: Button("キャンセル") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("保存") {
                viewModel.addReminder(title: title, dueDate: dueDate)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

