//
//  UserInfoView.swift
//  Karate Do
//
//  Created by aNaKuWaiTy on 8/4/16.
//  Copyright © 2016 SaifHendal. All rights reserved.
//

import UIKit

class UserInfoView: UIView {

    override func awakeFromNib() {
        
        // Shadow setting
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.8).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(5.0, 0.0)
        
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.8).CGColor
    }

}
