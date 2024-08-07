//
//  ContentView.swift
//  MPH_Reimind
//
//  Created by 高橋涼太 on 2024/08/07.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ReminderViewModel()
    @State private var showingAddReminderView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.reminders) { reminder in
                    HStack {
                        Text(reminder.title)
                        Spacer()
                        Text(reminder.dueDate, style: .date)
                        if reminder.isCompleted {
                            Image(systemName: "checkmark")
                        }
                    }
                    .onTapGesture {
                        viewModel.toggleCompletion(of: reminder)
                    }
                }
            }
            .navigationTitle("Reminders")
            .navigationBarItems(trailing: Button(action: {
                showingAddReminderView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddReminderView) {
                AddReminderView(viewModel: viewModel)
            }
        }
    }
}

