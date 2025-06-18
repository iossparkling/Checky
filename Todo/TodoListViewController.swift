//
//  ViewController.swift
//  Todo
//
//  Created by Deltrin Sam on 04/10/23.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var viewModel: TodoListViewModel!
    var customView: TodoListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = TodoListViewModel()
        customView = TodoListView()
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
        view = customView
        
        // Register the cell class with the table view
            customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoCell")
            
            // Set up your UI elements and constraints as needed
            customView.addButton.addTarget(self, action: #selector(addTodoButtonTapped), for: .touchUpInside)
    }

    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        let todoViewModel = viewModel.todos[indexPath.row]
        cell.textLabel?.text = todoViewModel.title
        cell.accessoryType = todoViewModel.isDone ? .checkmark : .none
        return cell
    }
    
    // UITableViewDelegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todoViewModel = viewModel.todos[indexPath.row]
        // Handle selection, e.g., toggle the todo item
        todoViewModel.isDone.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    // Method to add new todos
    @objc func addTodoButtonTapped() {
        let alertController = UIAlertController(title: "Add Todo", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter your task"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            if let task = alertController.textFields?.first?.text, !task.isEmpty {
                self?.viewModel.addTodo(title: task)
                self?.customView.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // Other methods for managing todos
}
