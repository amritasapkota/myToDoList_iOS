//
//  ViewController.swift
//  MyTaskList
//
//  Created by Amrita Sapkota on 5/8/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var myTasks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MyTasks"
        tableView.delegate = self
        tableView.dataSource = self
        
        //Set up
        
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        //Get all current saved tasks
        updateMyTasks()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "taskDisplayViewController") as! TaskDisplayViewController
        vc.title = "New Task"
        vc.myTask = myTasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskListTableViewCell", for: indexPath)
        cell.textLabel?.text = myTasks[indexPath.row]
        return cell
        
    }
    
    
    
    func updateMyTasks(){
        myTasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        for x in 0..<count {
            if let myTask = UserDefaults().value(forKey: "myTask_\(x+1)") as? String {
                myTasks.append(myTask)
            }
        }
        tableView.reloadData()
    }
    

    @IBAction func didTapAdd(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "taskEntryViewController") as! TaskEntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateMyTasks()
            }
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}



//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//
//        let vc = storyboard?.instantiateViewController(withIdentifier: "taskDisplayViewController") as! TaskDisplayViewController
//        vc.title = "New Task"
//        vc.myTask = myTasks[indexPath.row]
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
//}
//
//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return myTasks.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "taskListTableViewCell", for: indexPath)
//        cell.textLabel?.text = myTasks[indexPath.row]
//        return cell
//
//    }
//}
