//
//  DayViewController.swift
// Team 6: Pic-A-Day
// Developed by: Takudzwa
//List of Changes:

//List of Known Bugs:

import UIKit

class DayViewController: UIViewController {

    @IBOutlet weak var SelectedDate: UILabel?
    @IBAction func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    var myDate = String()
    var myDateNumber = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SelectedDate?.text = myDate
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
