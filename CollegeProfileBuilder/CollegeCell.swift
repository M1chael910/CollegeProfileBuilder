//
//  CollegeCell.swift
//  CollegeProfileBuilder
//
//  Created by Michael Murphy on 10/11/18.
//  Copyright © 2018 Michael Murphy. All rights reserved.
//

import UIKit

class CollegeCell: UITableViewCell {

    @IBOutlet weak var collegeTitleLbl: UILabel!
    
    @IBOutlet weak var collegeAmountOfStudentsLbl: UILabel!
    
    func updateCell(college: College) {
        collegeTitleLbl.text = college.name
        collegeAmountOfStudentsLbl.text = college.numberOfStudents
    }
    
}
