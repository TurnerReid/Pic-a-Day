//
//  DayViewController.swift
//  VisualCalendar
//
//  Created by Clifford Fung on 2018-11-01.
//  Copyright © 2018 Clifford Fung. All rights reserved.
//

import UIKit

class DayViewController: UIViewController {

    @IBOutlet weak var SelectedDate: UILabel?
    
    var myDate = String()
    var myDateNumber = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SelectedDate?.text = myDate
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
