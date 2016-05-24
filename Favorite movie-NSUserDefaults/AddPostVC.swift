//
//  AddPostVC.swift
//  Favorite movie-NSUserDefaults
//
//  Created by Stanley on 3/25/16.
//  Copyright © 2016 Stanley. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var PostImg: UIImageView!
    @IBOutlet weak var TitleField: UITextField!
    @IBOutlet weak var PostDesc: UITextField!
    @IBOutlet weak var IMDBurl: UITextField!
    @IBOutlet weak var IMDBPlot: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    @IBAction func AddPicBtnPressed(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func AddMovieBtnPressed(sender: UIButton!) {
        if let image = PostImg.image, title = TitleField.text, let movieDesc = PostDesc.text, let url = IMDBurl.text, let criticDesc = IMDBPlot.text {
            
            let imgPath = DataService.instance.saveImageAndCreatePath(image)
            
            let post = Post(imagePath: imgPath, title: title, description: movieDesc, url: url, IMDBPlot: criticDesc)
            DataService.instance.addPost(post)
            
            navigationController?.popToRootViewControllerAnimated(true)
        }
    }
        
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        PostImg.image = image
    }

}
