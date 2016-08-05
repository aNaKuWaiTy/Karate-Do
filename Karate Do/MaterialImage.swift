//
//  MaterialImage.swift
//  Karate Do
//
//  Created by aNaKuWaiTy on 8/1/16.
//  Copyright © 2016 SaifHendal. All rights reserved.
//

import UIKit

class MaterialImage: UIImageView {

    override func layoutSubviews() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0).CGColor
            
        // Shadow setting
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.8).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
}
