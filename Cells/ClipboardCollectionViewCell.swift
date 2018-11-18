//
//  ClipboardCollectionViewCell.swift
// Team 6: Pic-A-Day
// Developed by: Takudzwa
//List of Changes:
//  - commented out clipboard image, class is not implemented 

//List of Known Bugs:

import UIKit

class ClipboardCollectionViewCell: UICollectionViewCell {
   // @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet private weak var mainImage : UIImageView!
    
     @ IBOutlet weak var selectionImage: UIImageView!
     var isEditing: Bool = false {
         didSet {
         selectionImage.isHidden = !isEditing
         }
     }
    
    /*
    var image: ClipboardImage? {
        didSet {
            if let image = image {
                mainImage.image = UIImage(named: ClipboardImage.photo)
            }
        }
    }
     // remove any image being displayed when cell is recycled
     
     override func prepareForReuse() {
        mainImage.image = nil
     }
     
     */

     override var isSelected: Bool {
         didSet {
         selectionImage.image = isSelected ? UIImage(named: "Checked") : UIImage(named: "Unchecked")
         }
     }
}


