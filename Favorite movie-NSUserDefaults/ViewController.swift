//
//  ViewController.swift
//  Favorite movie-NSUserDefaults
//
//  Created by Stanley on 3/24/16.
//  Copyright © 2016 Stanley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var valueToPassTitle: String!
    var valueToPassImage: UIImage!
    var valueToPassDesc: String!
    var valueToPassIMDBplot: String!
    var valuetoPassIMDBurl: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.instance.loadPosts()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postsLoaded", object: nil)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            cell.configureCellMain(post)
            return cell
        } else {
            let cell = PostCell()
            cell.configureCellMain(post)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func onPostsLoaded(notif: AnyObject) {
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print("You have selected #\(indexPath.row)!")
        
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! PostCell
        
        valueToPassTitle = currentCell.titleLbl.text
        valueToPassImage = currentCell.postImg.image
        valueToPassDesc = currentCell.descLbl.text
        valueToPassIMDBplot = currentCell.IMDBPlotLbl.text
        valuetoPassIMDBurl = currentCell.urlLbl.text
//        print(valueToPassTitle)
        performSegueWithIdentifier("imageClicked", sender: self)
        
    }
    
//    @IBAction func movieClicked(sender: AnyObject) {
//        performSegueWithIdentifier("imageClicked", sender: selectedCell)
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "imageClicked" {
            if let imgClickedVC = segue.destinationViewController as? imageClickedVC {
                imgClickedVC.movieTransferText = valueToPassTitle
                imgClickedVC.movieTransferImage = valueToPassImage
                imgClickedVC.movieTransferDesc = valueToPassDesc
                imgClickedVC.movieTransferIMDBplot = valueToPassIMDBplot
                imgClickedVC.movieTransferIMDBurl = valuetoPassIMDBurl
            }
        }
    }
}

