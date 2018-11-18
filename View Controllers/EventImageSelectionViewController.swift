//
//  EventImageSelectionViewController.swift
// Team 6: Pic-A-Day
// Developed by: Takudzwa
//List of Changes:

//List of Known Bugs:
import UIKit

class EventImageSelectionViewController: UIViewController {
    @IBOutlet weak var eventImageSelectionCollectionView: UICollectionView!
    var collectionData = [#imageLiteral(resourceName: "class-day"), #imageLiteral(resourceName: "birthday-party2"), #imageLiteral(resourceName: "class-day"), #imageLiteral(resourceName: "birthday-party2")]
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (view.frame.size.width) / 5
        let layout = eventImageSelectionCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
}


extension EventImageSelectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventImageSelectionCollectionViewCell", for: indexPath)
        if let imageView = cell.viewWithTag(100) as? UIImageView{
            imageView.image = collectionData[indexPath.row]
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isEditing {
            navigationController?.isToolbarHidden = false
        }
    }
}
