//
//  AddPostVC.swift
//  My Hood
//
//  Created by Kyle Lee on 11/12/15.
//  Copyright © 2015 Kyle Lee. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {

    @IBOutlet var postImg: UIImageView!
    
    @IBOutlet var titleField: UITextField!
    
    @IBOutlet var descriptionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.postImg.layer.cornerRadius = self.postImg.frame.width / 2
        self.postImg.clipsToBounds = true

    }

    @IBAction func makePostBtnPressed(sender: AnyObject) {
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPicBtnPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
    }

}
