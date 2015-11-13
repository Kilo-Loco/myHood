//
//  AddPostVC.swift
//  My Hood
//
//  Created by Kyle Lee on 11/12/15.
//  Copyright © 2015 Kyle Lee. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet var postImg: UIImageView!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var descriptionField: UITextField!
    
    var imagePicker: UIImagePickerController!
    var keyboard: UITextFieldDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.postImg.layer.cornerRadius = self.postImg.frame.width / 2
        self.postImg.clipsToBounds = true
        self.imagePicker = UIImagePickerController()
        self.imagePicker.delegate = self
        self.titleField.delegate = self
        self.descriptionField.delegate = self
    }

    @IBAction func makePostBtnPressed(sender: AnyObject) {
        if let title = self.titleField.text, let desc = self.descriptionField.text, let img = self.postImg.image {
            
            let imagePath = DataService.instance.saveImageAndCreatePath(img)
            
            let post = Post(imagePath: imagePath, title: title, description: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPicBtnPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.imagePicker.dismissViewControllerAnimated(true, completion: nil)
        self.postImg.image = image
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.titleField.resignFirstResponder()
        self.descriptionField.resignFirstResponder()
        return true
    }

}
