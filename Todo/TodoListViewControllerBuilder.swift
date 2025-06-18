//
//  TodoListViewControllerBuilder.swift
//  Todo
//
//  Created by Deltrin Sam on 04/10/23.
//

import UIKit

class TodoListViewControllerBuilder {
    private var viewModel: TodoListViewModel?
    private var todoListView: TodoListView?
    
    func setViewModel(_ viewModel: TodoListViewModel) -> Self {
        self.viewModel = viewModel
        return self
    }
    
    func setTodoListView(_ todoListView: TodoListView) -> Self {
        self.todoListView = todoListView
        return self
    }
    
    func build() -> TodoListViewController {
        guard let viewModel = viewModel, let todoListView = todoListView else {
            fatalError("ViewModel and TodoListView are required to build TodoListViewController")
        }
        
        let todoListViewController = TodoListViewController()
        todoListViewController.viewModel = viewModel
        todoListViewController.customView = todoListView
        return todoListViewController
    }
}
