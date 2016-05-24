//
//  RoundedPics.swift
//  Favorite movie-NSUserDefaults
//
//  Created by Stanley on 3/24/16.
//  Copyright © 2016 Stanley. All rights reserved.
//

import UIKit

class RoundedPics: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10.0
        clipsToBounds = true
    }
}
