//
//  WeekViewController.swift
//  Pic-A-Day
//
//  Created by Clifford Fung on 2018-11-17.
//  Copyright © 2018 Takudzwa Mhonde. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func MonthView(_ sender: Any) {
        performSegue(withIdentifier: "WeekToMonthSegue", sender: self)
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
