//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Powers Mikaela on 4/16/24.
//

import Foundation
struct ToDoItem: Identifiable, Equatable {
    var name: String
    var isCompleted: Bool = false
    var id: UUID = UUID()
}
