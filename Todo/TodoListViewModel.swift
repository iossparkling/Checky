//
//  TodoListViewModel.swift
//  Todo
//
//  Created by Deltrin Sam on 04/10/23.
//

import Foundation

class TodoListViewModel {
    var todos: [TodoViewModel] = []
    
    func addTodo(title: String) {
        let todo = Todo(id: UUID(), title: title, isDone: false)
        let todoViewModel = TodoViewModel(todo: todo)
        todos.append(todoViewModel)
    }
    
    // Implement other methods like deleteTodo, toggleTodo, etc.
    
    func deleteTodo(at index: Int) {
        if index >= 0, index < todos.count {
            todos.remove(at: index)
        }
    }
    
    func toggleTodo(at index: Int) {
        if index >= 0, index < todos.count {
            todos[index].isDone.toggle()
        }
    }
}
