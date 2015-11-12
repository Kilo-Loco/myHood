//
//  ViewController.swift
//  My Hood
//
//  Created by Kyle Lee on 11/12/15.
//  Copyright © 2015 Kyle Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func postBtn(sender: UIButton) {
        print("Button clicked")
    }
    
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let post = Post(imagePath: "", title: "Post1", description: "Post1 description")
        let post2 = Post(imagePath: "", title: "Post2", description: "Post2 description")
        let post3 = Post(imagePath: "", title: "Post3", description: "Post3 description")
        
        posts.append(post)
        posts.append(post2)
        posts.append(post3)
        
        self.tableView.reloadData()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = self.posts[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
        } else {
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 79.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
}

