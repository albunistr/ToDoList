//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Powers Mikaela on 4/16/24.
//

import Foundation

class ToDoListViewModel: ObservableObject {
    @Published var toDos: [ToDoItem] = [ToDoItem(name: "Walk a dog")]
    
    func delete(index: IndexSet) {
        toDos.remove(atOffsets: index)
    }
    
    func add(name: String) {
        let newToDo = ToDoItem(name: name)
            toDos.append(newToDo)
    }
    
    func complete (todo: ToDoItem) {
        guard let index = toDos.firstIndex(of: todo) else { return }
        toDos[index].isCompleted.toggle()
    }
}
