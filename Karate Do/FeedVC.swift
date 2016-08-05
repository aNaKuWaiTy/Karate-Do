//
//  FeedVC.swift
//  Karate Do
//
//  Created by aNaKuWaiTy on 8/1/16.
//  Copyright © 2016 SaifHendal. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        DataService.ds.REF_POSTS.observeEventType(.Value, withBlock: { (snapshot) in
            
            self.posts = []
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    print("SNAP: \(snap)")
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(postKey: key, postData: postDict)
                        self.posts.append(post)
                    }
                }
                
            }
            self.tableView.reloadData()
        })
    }
    
//    // Sign out
//    @IBAction func signOutTapped(sender: AnyObject) {
//        let keychainResult = KeychainWrapper.removeObjectForKey(KEY_UID)
//        print("KarateDo: \(keychainResult)")
//        try! FIRAuth.auth()?.signOut()
//         performSegueWithIdentifier("goToSignVC", sender: nil)
//    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        print(post.caption)
        
        return tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
