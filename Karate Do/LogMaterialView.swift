//
//  LogMaterialView.swift
//  Karate Do
//
//  Created by aNaKuWaiTy on 7/26/16.
//  Copyright © 2016 SaifHendal. All rights reserved.
//

import UIKit

class LogMaterialView: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = 20.0
        
        // Shadow setting
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }

}
