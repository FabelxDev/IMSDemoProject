//
//  AppDelegate.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import UIKit
import TwitterKit
import Firebase


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        TWTRTwitter.sharedInstance().start(withConsumerKey: TwitterService.apiKey, consumerSecret: TwitterService.apiKeySecret)
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }

}

struct APIResponse: Codable {
    let search_metadata: AAPIResponse
    let statuses: ABPIResponse
}

struct AAPIResponse: Codable {
    
}

struct ABPIResponse: Codable {
    let text: String
}
