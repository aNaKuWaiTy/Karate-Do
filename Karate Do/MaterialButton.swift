//
//  MaterialButton.swift
//  Karate Do
//
//  Created by aNaKuWaiTy on 7/31/16.
//  Copyright © 2016 SaifHendal. All rights reserved.
//

import UIKit

class MaterialButton: UIButton {
    
    override func awakeFromNib() {
        
        // Shadow setting
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSizeMake(2.0, 2.0)
        imageView?.contentMode = .ScaleAspectFit
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0).CGColor
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }

}
