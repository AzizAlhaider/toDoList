//
//  TaskViewController.swift
//  FinalProject
//
//  Created by Aziz Alhaider on 10/23/20.
//  Copyright © 2020 Aziz Alhaider. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet var lable: UILabel!
    
    var task: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lable.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "حذف", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask(){
        
        
        
//        let newCount = count - 1
//        
//        
//        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().setValue(nil, forKey: "task\(currentPosition)")

    }

    
}
