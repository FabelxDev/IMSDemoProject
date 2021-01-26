//
//  LoginResponse.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import Foundation


struct GetLastTweetResponse: Codable {
    var tweet: String
}

struct ProfilePictureResponse: Codable {
    var pictureURL: String
}


