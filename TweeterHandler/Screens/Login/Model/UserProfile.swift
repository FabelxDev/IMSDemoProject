//
//  UserProfile.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 25/01/2021.
//

import Foundation


struct UserDetails {
    var username: String = ""
    var photoURL: String?
    var lastTweet: String?
    
    init(username: String, photoURL: String?, lastTweet: String?) {
        self.username = username
        self.photoURL = photoURL
        self.lastTweet = lastTweet
    }
    
    init() {
        
    }
}
