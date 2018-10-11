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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editCollege", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let collegeCell = tableView.dequeueReusableCell(withIdentifier: "CollegeCell", for: indexPath) as! CollegeCell
        let college = colleges[indexPath.row]
        collegeCell.updateCell(college: college)
        return collegeCell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editCollege" {
            let college = colleges[(collegeListTableView.indexPathForSelectedRow?.row)!]
            let editCollegeVC = segue.destination as! AddCollegeVC
            editCollegeVC.college = college
        }
    }


}

