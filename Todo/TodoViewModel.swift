//
//  TodoViewModel.swift
//  Todo
//
//  Created by Deltrin Sam on 04/10/23.
//

import Foundation

class TodoViewModel {
    private var todo: Todo
    
    init(todo: Todo) {
        self.todo = todo
    }
    
    var id: UUID {
        return todo.id
    }
    
    var title: String {
        return todo.title
    }
    
    var isDone: Bool {
        get {
            return todo.isDone
        }
        set {
            todo.isDone = newValue
        }
    }
}
