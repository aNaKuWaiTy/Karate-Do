//
//  PostCell.swift
//  Karate Do
//
//  Created by aNaKuWaiTy on 8/1/16.
//  Copyright © 2016 SaifHendal. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var nationalitiLbl: UILabel!
    @IBOutlet weak var postscountLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(post: Post) {
        self.post = post
        self.postscountLbl.text = "\(post.likes)"
        self.nationalitiLbl.text = post.nationaliti
        
    }
    
    

}
