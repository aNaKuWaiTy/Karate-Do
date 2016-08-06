//
//  Post.swift
//  Karate Do
//
//  Created by aNaKuWaiTy on 8/5/16.
//  Copyright © 2016 SaifHendal. All rights reserved.
//

import Foundation

class Post {
    private var _caption: String!
    private var _imageUrl: String!
    private var _likes: Int!
    private var _postKey: String!
    private var _nationaliti: String!
    
    var caption: String {
        return _caption
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var likes: Int {
        return _likes
    }
    
    var nationaliti: String {
        return _nationaliti
    }
    
    var postKey: String {
        return _postKey
    }
    
    
    init(caption: String, imageUrl: String, likes: Int, nationaliti: String) {
        self._caption = caption
        self._imageUrl = imageUrl
        self._likes = likes
        self._nationaliti = nationaliti
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self._postKey = postKey
        
        if let caption = postData["caption"] as? String {
            self._caption = caption
        }
        
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let nationaliti = postData["nationaliti"] as? String {
            self._nationaliti = nationaliti
        }
        
        if let likes = postData["likes"] as? Int {
            self._likes = likes
        }
        
        
        
    }
}
















