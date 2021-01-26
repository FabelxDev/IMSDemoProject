//
//  LoginRequest.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import Foundation


struct LoginRequest: Codable {
    
    let email: String
    let password: String
}
