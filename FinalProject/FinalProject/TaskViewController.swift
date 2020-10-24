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

    }
   
        
    
   
      
    @IBAction func d(_ sender: UIButton) {
        let count = UserDefaults().value(forKey: "count") as? Int
        let newCounter = count! - 1
        
        UserDefaults().setValue(newCounter, forKey: "count")
        UserDefaults().setValue(nil, forKey: "task_\(count!-1)")

        UserDefaults.standard.removeObject(forKey: "task_\(count!-1)")
        navigationController?.popViewController(animated: true)
    }
    

    
    
    

    
    
    
    
           
        




       





    

    




}
