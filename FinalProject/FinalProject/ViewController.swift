//
//  ViewController.swift
//  FinalProject
//
//  Created by Aziz Alhaider on 10/15/20.
//  Copyright © 2020 Aziz Alhaider. All rights reserved.
//

import UIKit
 var tasks = [String]()
class ViewController: UIViewController {

    
    @IBOutlet var tableView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "المهام"
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        let count = UserDefaults().value(forKey: "count") as? Int
//
//        let newCount = count! + 1
//
//               UserDefaults().set(newCount, forKey: "count")
//
//               UserDefaults().set(text, forKey: "task_\(newCount)")
//
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
             UserDefaults().set(0, forKey: "count")
        }

        // Do any additional setup after loading the view.
        updateTasks()
    }
    
  
    func updateTasks(){
        
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
           return
        }
        
        for x in 0..<count {
            
            if let task = UserDefaults().value(forKey: "task_\(x+1)")as? String{
                tasks.append(task)
            }
            
            
        }
        tableView.reloadData()
    }
    
    @IBAction func didTapAdd() {
        
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title = "اضافة مهام"
        vc.update = {
            DispatchQueue.main.async {
                 self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }

}
extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewController
        vc.title = "new task"
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
}
