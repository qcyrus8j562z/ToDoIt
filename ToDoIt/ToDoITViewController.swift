//
//  ViewController.swift
//  ToDoIt
//
//  Created by Quebtin Cyrus on 8/29/19.
//  Copyright © 2019 Quentin Cyrus. All rights reserved.
//

import UIKit

class ToDoItViewController: UITableViewController{
    
    // create new item array
    
    var itemArray = ["Design Tutorial App", "Put App on App Store", "Sell App", "Make Dat Money"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Mark - Tableview Datasource Methods
    
    // number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count // creates specific number of cells
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) // reusable cell
        
        cell.textLabel?.text = itemArray[indexPath.row] // set text label property
        
        return cell
    }
    
    //MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row]) prints row to console
        
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark prints corresponding item to console
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark { // create checkmark as an accessory
             tableView.cellForRow(at: indexPath)?.accessoryType = .none // conditional to check and uncheck items
        }
        
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true) // gets rid of highlighting item in gray
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
       
        
        var textField = UITextField() // create a text field
        
        let alert = UIAlertController(title: "Add New ToDoIt Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen when user clicks the Add Item button on our UIAlert
            // print(textField.text)  prints success to debug console
            
            self.itemArray.append(textField.text!)
            
            self.tableView.reloadData()
            
           
        }
        
        alert.addTextField { (alertTextField) in  // create new text field to alert
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            
            print(alertTextField.text)
            
            
        }
        
        
        alert.addAction(action) // add action
        
        present(alert, animated: true, completion: nil) // show alert
        
    }
    
    
    


}

