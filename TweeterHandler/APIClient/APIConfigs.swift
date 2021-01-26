//
//  APIConfigs.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import Foundation


struct APIConfigs {
    
    struct URLs {
        
        static let apiBaseUrl: String  = "https://api.twitter.com"
        static let authenticateUrl: String = "/oauth/authorize?oauth_token="
        
        struct Login {
            static let path: String  = "auth/login"
        }
        struct Token {
            static let path: String = "oauth/request_token"
        }
        
        struct UserProfile {
            static let path: String = "users"
        }
    }
    
}
