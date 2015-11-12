//
//  PostCell.swift
//  My Hood
//
//  Created by Kyle Lee on 11/12/15.
//  Copyright © 2015 Kyle Lee. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(post: Post) {
        self.titleLbl.text = post.title
        self.descLbl.text = post.postDesc
    }
    

}
