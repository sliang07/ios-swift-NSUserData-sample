//
//  PostCell.swift
//  Favorite movie-NSUserDefaults
//
//  Created by Stanley on 3/24/16.
//  Copyright © 2016 Stanley. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var urlLbl: UILabel!
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var IMDBPlotLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Stops tableview, view background color to stop disappearing when selected
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        let color = self.viewBG!.backgroundColor // Store the color
        super.setHighlighted(highlighted, animated: animated)
        self.viewBG?.backgroundColor = color
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        let color = self.viewBG!.backgroundColor // Store the color
        super.setSelected(selected, animated: animated)
        self.viewBG?.backgroundColor = color
    }
    
    func configureCellMain(post: Post){
        postImg.image = DataService.instance.imageForPath(post.imagePath)
        titleLbl.text = post.title
        descLbl.text = post.postDesc
        urlLbl.text = post.url
        IMDBPlotLbl.text = post.IMDBPlot
    }
    
}
