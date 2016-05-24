//
//  Posts.swift
//  Favorite movie-NSUserDefaults
//
//  Created by Stanley on 3/24/16.
//  Copyright © 2016 Stanley. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    private var _imagePath: String!
    private var _title: String!
    private var _postDesc: String!
    private var _url: String!
    private var _IMDBPlot: String!
    
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDesc: String {
        return _postDesc
    }
    
    var url: String {
        return _url
    }
    
    var IMDBPlot: String {
        return _IMDBPlot
    }
    
    init(imagePath: String, title: String, description: String, url: String, IMDBPlot: String) {
        self._imagePath = imagePath
        self._title = title
        self._postDesc = description
        self._url = url
        self._IMDBPlot = IMDBPlot
    }
    
    override init() {
        
    }
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagepath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDesc = aDecoder.decodeObjectForKey("description") as? String
        self._url = aDecoder.decodeObjectForKey("url") as? String
        self._IMDBPlot = aDecoder.decodeObjectForKey("IMDBPlot") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.imagePath, forKey: "imagepath")
        aCoder.encodeObject(self.title, forKey: "title")
        aCoder.encodeObject(self.postDesc, forKey: "description")
        aCoder.encodeObject(self.url, forKey: "url")
        aCoder.encodeObject(self.IMDBPlot, forKey: "IMDBPlot")
    }
}