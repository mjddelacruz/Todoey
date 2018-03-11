//
//  ViewController.swift
//  Todoey
//
//  Created by Michael Dela Cruz on 10/3/18.
//  Copyright © 2018 Michael Dela Cruz. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Fine Mike", "Bili ng itlog", "code code code!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK - Tableview datasource methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray [indexPath.row]
        
        return cell
    }
    
    //Mark - Tableview delegate method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        }
        else {
            cell?.accessoryType = .checkmark
        }
        
        
    }
    
    //MARK - add new items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField : UITextField = UITextField()

        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen
            print(textField.text!)
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
            
        }
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
       
        
    }
    
}

