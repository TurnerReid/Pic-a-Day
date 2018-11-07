//
//  ViewController.swift
// Team 6: Pic-A-Day
// Developed by: Clifford
// Updated and Modified by: Clifford & Takudzwa

//List of Changes:
//  - implemented to account for leap years
//  - added the sugue to day view
//  - added the data to pass through to segue from month view to day view
//  - commented out the change of colours for the weekend cells
//  - added constraints to the collection view to format the cells

//List of Known Bugs:
//  - Missing the selected day to pass through the segue, but contains a thread error when attempting to pass through
//  - Thread 1 error when unwrapping dateLabel into the DayViewSegue

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var Calendar: UICollectionView!
    @IBOutlet weak var MonthLabel: UILabel!
    
    //variables
    var imagePickerController:UIImagePickerController!

    //list of local variables used for the month view
    let Months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    let DaysOfMonth = ["Monday","Thuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonth = String()
    var NumberOfEmptyBox = Int()
    var NextNumberOfEmptyBox = Int()
    var PreviousNumberOfEmptyBox = 0
    var Direction = 0
    var PositionIndex = 0
    var LeapYearCounter = 2
    var dayCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Creates the contraints for cells and the spacing inside the collection view
        let width = (view.frame.size.width) / 9
        let layout = Calendar.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width-40, height: width-65)
        currentMonth = Months[month]
        MonthLabel.text = "\(currentMonth) \(year)"
        if weekday == 0 {
            weekday = 7
        }
        GetStartDateDayPosition()
    }
    
    //Calculates the number of empty boxes at the start of every month
    func GetStartDateDayPosition() {
        switch Direction{
        case 0:
            NumberOfEmptyBox = weekday
            dayCounter = day
            while dayCounter>0 {
                NumberOfEmptyBox = NumberOfEmptyBox - 1
                dayCounter = dayCounter - 1
                if NumberOfEmptyBox == 0 {
                    NumberOfEmptyBox = 7
                }
            }
            if NumberOfEmptyBox == 7 {
                NumberOfEmptyBox = 0
            }
            PositionIndex = NumberOfEmptyBox
        case 1...:
            NextNumberOfEmptyBox = (PositionIndex + DaysInMonths[month])%7
            PositionIndex = NextNumberOfEmptyBox
            
        case -1:
            PreviousNumberOfEmptyBox = (7 - (DaysInMonths[month] - PositionIndex)%7)
            if PreviousNumberOfEmptyBox == 7 {
                PreviousNumberOfEmptyBox = 0
            }
            PositionIndex = PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    //Defines the next button for the next month in the calendar
    @IBAction func Next(_ sender: Any) {
        switch currentMonth {
        case "December":
            Direction = 1
            
            month = 0
            year += 1
            
            //checks if the current year is a leap year
            if LeapYearCounter  < 5 {
                LeapYearCounter += 1
            }
            
            if LeapYearCounter == 4 {
                DaysInMonths[1] = 29
            }
            
            if LeapYearCounter == 5{
                LeapYearCounter = 1
                DaysInMonths[1] = 28
            }
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            
            Calendar.reloadData()
        default:
            Direction = 1
            
            GetStartDateDayPosition()
            
            month += 1
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            
            Calendar.reloadData()
        }
    }
    
    @IBAction func cameraBtnPressed () {
        // create an instance of the UIImagePickerController
        imagePickerController = UIImagePickerController()
        //assign the delegate
        imagePickerController.delegate = self
        //specify the camera to be used
        imagePickerController.sourceType = .camera
        //start up the UIImagePickerController
        present(imagePickerController, animated: true, completion: nil)
        //performSegue(withIdentifier: "ImagePreviewSegue", sender: self)
    }
    
    //Defines the previous button for the previous month in sequence
    @IBAction func Back(_ sender: Any) {
        switch currentMonth {
        case "January":
            Direction = -1
            
            month = 11
            year -= 1
            
            //checks if the current year is a leap year
            if LeapYearCounter > 0{
                LeapYearCounter -= 1
            }
            if LeapYearCounter == 0{
                DaysInMonths[1] = 29
                LeapYearCounter = 4
            }else{
                DaysInMonths[1] = 28
            }
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
            
        default:
            Direction = -1
            
            month -= 1
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        }
    }
    
    //Calculate the number of items in each month for the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Direction{
        case 0:
            return DaysInMonths[month] + NumberOfEmptyBox
        case 1...:
            return DaysInMonths[month] + NextNumberOfEmptyBox
        case -1:
            return DaysInMonths[month] + PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    //labels the date in each cell inside the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        
        cell.backgroundColor = UIColor.clear
        cell.DateLabel.textColor = UIColor.black
        cell.DateLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        cell.Circle.isHidden = true
        
        if cell.isHidden{
            cell.isHidden = false
        }
        //the first cells of the month that needs to be hidden will be <1 so we can hide them easily
        switch Direction {
        case 0:
            cell.DateLabel.text = "\(indexPath.row + 1 - NumberOfEmptyBox)"
            
        case 1:
            cell.DateLabel.text = "\(indexPath.row + 1 - NextNumberOfEmptyBox)"
            
        case -1:
            cell.DateLabel.text = "\(indexPath.row + 1 - PreviousNumberOfEmptyBox)"
            
        default:
            fatalError()
        }
        
        //hide all cells that have a value of -1 or 0
        if Int(cell.DateLabel.text!)! < 1{
            cell.isHidden = true
        }
        
   //  Change the colour of the text for the weekend to differentiate from the weekdays
         switch indexPath.row {
        case 5,6,12,13,19,20,26,27,33,34:
            if Int(cell.DateLabel.text!)! > 0 {
                cell.DateLabel.textColor = UIColor.lightGray
            }
        default:
            break
        }
    
        if currentMonth == Months[calendar.component(.month, from: date) - 1] && year == calendar.component(.year, from: date) && indexPath.row + 1 - NumberOfEmptyBox == day{
            cell.Circle.isHidden = false
            cell.DrawCircle()
            
        }
        
        return cell
    }
    
    //segue to day view when the cell is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        performSegue(withIdentifier: "DayViewSegue", sender: self)
        
    }
    //passing the month and year into the dayview
    //missing the day of month to pass through
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DayViewSegue"
        {
            //invokes if the segue invoked from this view controller is the Day View Segue
            let dayController = segue.destination as! DayViewController
            dayController.myDate = "\(currentMonth) \(year)"
            //  dayController.myDateNumber =
        }
        if segue.identifier == "ImageViewSegue"
        {
            //invokes if the segue invoked from this view controller is the Image View Segue
            let photoController = segue.destination as! PhotoPreviewViewController
            photoController.imagePickerController = imagePickerController
        }
    }
    
}
