//
//  TaskEntryViewController.swift
//  MyTaskList
//
//  Created by Amrita Sapkota on 5/8/21.
//

import UIKit

class TaskEntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var task_TF: UITextField!
    var update: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        task_TF.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveMyTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveMyTask()
        
        return true
    }
    
    @objc func saveMyTask() {
        guard let text = task_TF.text, !text.isEmpty else {
            return
        }
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        let newCount = count + 1
        UserDefaults().set(newCount,forKey: "count")
        UserDefaults().set(text,forKey: "myTask_\(newCount)")
        update?()
        navigationController?.popViewController(animated: true)
    }

}
