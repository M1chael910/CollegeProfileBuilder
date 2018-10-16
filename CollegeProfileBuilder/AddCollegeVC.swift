//
//  AddCollegeVC.swift
//  CollegeProfileBuilder
//
//  Created by Michael Murphy on 10/10/18.
//  Copyright © 2018 Michael Murphy. All rights reserved.
//

import UIKit
import SafariServices

class AddCollegeVC: UIViewController {
    
    @IBOutlet weak var collegeNameTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var webPageTextField: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var college: College!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let college = college {
            setInitialProperties(from: college)
        }
    }
    func saveProperties(for college: College) {
        college.name = collegeNameTextField.text ?? "No College Name"
        college.website = webPageTextField.text ?? "No Webpage"
        college.amountOfStudents = numberOfStudentsTextField.text ?? "Not Listed"
    }
    
    @IBAction func collegeNameChanged(_ sender: UITextField) {
        updateNavItem(with: sender.text!)
    }
    
    func setInitialProperties(from college: College) {
        collegeNameTextField.text = college.name
        numberOfStudentsTextField.text = college.amountOfStudents
        webPageTextField.text = college.website
    }
    
    
    func updateNavItem(with text: String) {
        self.navigationItem.title = text
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveBtnPressed" {
            let collegeVC = segue.destination as! CollegeListVC
            if let college = college {
                saveProperties(for: college)
            } else {
                let newCollege = College(context: context)
                saveProperties(for: newCollege)
                collegeVC.colleges.append(newCollege)
                collegeVC.collegeListTableView.reloadData()
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
            }
        }
    }
    
    
    
    
    
    
    @IBAction func viewWebpageBtnPressed(_ sender: UIButton) {
        let svc = SFSafariViewController(url: URL(string: "http://\(webPageTextField.text!)")!)
        present(svc, animated: true, completion: nil)
    }
    
    
    
}
