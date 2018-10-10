//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Michael Murphy on 10/10/18.
//  Copyright © 2018 Michael Murphy. All rights reserved.
//

import UIKit

class CollegeListVC: UIViewController {

    @IBOutlet weak var collegeListTableView: UITableView!
    
    var colleges = [College]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeListTableView.delegate = self
        collegeListTableView.dataSource = self
    }
    
    
    


}

