//
//  PhotoPreviewViewController.swift
// Team 6: Pic-A-Day
// Developed by: Takudzwa
//List of Changes:
//  - implemented a selection tool for the image clipboard
//List of Known Bugs:

import UIKit
//shows the images in the clipboard
class PhotoPreviewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var photo: UIImageView!
    var imagePickerController: UIImagePickerController!
    var image: UIImage!
    @IBAction func saveBtnPressed_TouchUpInside(_ sender: Any){
        
    }
    @IBAction func cancelBtnPressed_TouchUpInside(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // load the image
        photo.image = image
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //selects the images in the clipboard
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            image = pickedImage
        }
    }

}
