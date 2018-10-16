//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Michael Murphy on 10/10/18.
//  Copyright © 2018 Michael Murphy. All rights reserved.
//

import UIKit

class CollegeListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var collegeListTableView: UITableView!
    
    var colleges = [College]()
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeListTableView.delegate = self
        collegeListTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        collegeListTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.performSegue(withIdentifier: "editCollege", sender: nil)
    }
    
    func getData() {
        do {
            colleges = try! context.fetch(College.fetchRequest())
        }
        
        catch {
            print("data not recieved")
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let collegeCell = tableView.dequeueReusableCell(withIdentifier: "CollegeCell", for: indexPath) as! CollegeCell
        let college = colleges[indexPath.row]
        collegeCell.updateCell(college: college)
        return collegeCell
    }
    
    
    @IBAction func unwindToCollegelist(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func editBtnPressed(_ sender: UIBarButtonItem) {
        if sender.tag == 0 {
            collegeListTableView.isEditing = true
            sender.tag = 1
        } else {
            collegeListTableView.isEditing = false
            sender.tag = 0
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.remove(at: sourceIndexPath.row)
        colleges.insert(college, at: destinationIndexPath.row)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let removedCollege = colleges[indexPath.row]
            colleges.remove(at: indexPath.row)
            context.delete(removedCollege)
            collegeListTableView.reloadData()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editCollege" {
            
                let college = colleges[(collegeListTableView.indexPathForSelectedRow?.row)!]
                let editCollegeVC = segue.destination as! AddCollegeVC
                editCollegeVC.college = college
            
        }
        
        
        
    }
    



}

