//
//  imageClickedVC.swift
//  Favorite movie-NSUserDefaults
//
//  Created by Stanley on 4/7/16.
//  Copyright © 2016 Stanley. All rights reserved.
//

import UIKit

class imageClickedVC: UIViewController {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieIMDBplot: UILabel!
    @IBOutlet weak var movieIMDBurl: UILabel!
    
    var movieTransferText = ""
    var movieTransferImage: UIImage!
    var movieTransferDesc = ""
    var movieTransferIMDBplot = ""
    var movieTransferIMDBurl = ""
    
    override func viewDidLoad() {

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        movieTitle.text = movieTransferText
        movieImage.image = movieTransferImage
        movieDesc.text = movieTransferDesc
        movieIMDBplot.text = movieTransferIMDBplot
        movieIMDBurl.text = movieTransferIMDBurl
    }
    
}
