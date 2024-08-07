//
//  Reminder.swift
//  MPH_Reimind
//
//  Created by 高橋涼太 on 2024/08/07.
//

import Foundation

struct Reminder: Identifiable {
    var id = UUID()
    var title: String
    var dueDate: Date
    var isCompleted: Bool = false
}
