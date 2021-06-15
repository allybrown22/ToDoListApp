//
//  ToDoTableViewController.swift
//  ToDoListApp
//
//  Created by Ally Brown on 6/14/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {

var listOfToDo : [ToDoClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfToDo = createToDo()
    }
    
    func createToDo() -> [ToDoClass] {
        let swiftToDo = ToDoClass()
        swiftToDo.description = "learn swift"
        swiftToDo.important = true
        
        let dogToDo = ToDoClass()
        dogToDo.description = "walk the dog"
        
        return[swiftToDo , dogToDo]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfToDo.count
    }

    
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
    
        let eachToDo = listOfToDo[indexPath.row]
        cell.textLabel?.text = eachToDo.description
    
    if eachToDo.important {
        cell.textLabel?.text = "‼️" + eachToDo.description
    } else {
        cell.textLabel?.text = eachToDo.description
    }
    
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddToDoVC = segue.destination as?
        
    AddToDoViewController {
            nextAddToDoVC.previousToDoTVC = self
        }
        if let nextCompletedToDoVC = segue.destination as?
            CompletedToDoViewController {
            if let chosenToDo = sender as? ToDoClass {
                nextCompletedToDoVC.selectedToDo = chosenToDo
                nextCompletedToDoVC.previousToDoTVC = self
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let eachToDo = listOfToDo[indexPath.row]
        
        performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
    }
 }

