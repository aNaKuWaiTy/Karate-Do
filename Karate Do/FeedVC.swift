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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
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
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
        
    }

}
