//
//  TaskDisplayViewController.swift
//  MyTaskList
//
//  Created by Amrita Sapkota on 5/8/21.
//

import UIKit

class TaskDisplayViewController: UIViewController {

    @IBOutlet var task_Lbl: UILabel!
    var myTask: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        task_Lbl.text = myTask
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Remove", style: .done, target: self, action: #selector(removeTask))
    }

    
    @objc func removeTask(){
//        let newCount = count - 1
//        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().setValue(nil, forKey: "myTask_\(currentPosition)")
    }

}
