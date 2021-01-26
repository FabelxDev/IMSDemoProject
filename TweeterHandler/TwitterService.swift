//
//  TwitterService.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 24/01/2021.
//

import Foundation

class TwitterService {
    
    static let apiKey = "hIAsdQcCmfYkL4cutNfJeAe7T"
    static let apiKeySecret = "i4j6fE9mzfyBgq7j1Qn1vAHZnGN8UZZUkYviU5wqweDsUWyIQk"

}

extension Notification.Name {
    static let twitterCallback = Notification.Name(rawValue: "Twitter.CallbackNotification.Name")
}
