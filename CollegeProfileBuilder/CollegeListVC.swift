//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Michael Murphy on 10/10/18.
//  Copyright © 2018 Michael Murphy. All rights reserved.
//

import UIKit

class CollegeListVC: UIViewController {

    
    var colleges = [College]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

