//
//  ReminderViewModel.swift
//  MPH_Reimind
//
//  Created by 高橋涼太 on 2024/08/07.
//

import Foundation

class ReminderViewModel: ObservableObject {
    @Published var reminders: [Reminder] = []
    
    func addReminder(title: String, dueDate: Date) {
        let newReminder = Reminder(title: title, dueDate: dueDate)
        reminders.append(newReminder)
    }
    
    func toggleCompletion(of reminder: Reminder) {
        if let index = reminders.firstIndex(where: { $0.id == reminder.id }) {
            reminders[index].isCompleted.toggle()
        }
    }
}
