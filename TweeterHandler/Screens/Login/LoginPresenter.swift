//
//  LoginPresenter.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import Foundation
import TwitterKit
import FirebaseAuth


class LoginPresenter {
    
    private weak var view: LoginView?
    private var currentSession: TWTRSession?
    
    init(view: LoginView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setViews()
    }
    
    func login() {
        
        TWTRTwitter.sharedInstance().logIn { (session, error) in
            if let error = error {
                self.view?.displayError(with: "Error", message: error.localizedDescription)
            } else {
                guard let session = session else {
                    return
                }
                self.currentSession = session
            }
            self.fetchTwitterUser()
        }
    }
    
    private func fetchTwitterUser() {
        guard let session = currentSession else {
            return
        }
        let client = TWTRAPIClient()
        client.loadUser(withID: session.userID) { (user, error) in
            if let error = error {
                self.view?.displayError(with: "Unable to fetch user", message: error.localizedDescription)
                return
            }
            
            guard let user = user else {
                self.view?.displayError(with: "Unable to fetch user", message: "")
                return
            }
            
            //            let profilePictureUrl = user.profileImageURL
            //            let name = user.screenName
            //            let userDetails = UserDetails(username: name, photoURL: profilePictureUrl, lastTweet: nil)
            
            let twError:NSErrorPointer = nil
            let userId = user.userID
            
            let client = TWTRAPIClient(userID: userId)
            let request = client.urlRequest(withMethod: "GET", urlString: "https://api.twitter.com/1.1/search/tweets.json", parameters: ["q":"from:StackOverflow","result_type":"recent"], error: twError)
            
            if twError == nil {
                
                client.sendTwitterRequest(request, completion: { (response, data, error) -> Void in
                    
                    guard let data = data else { return }
                    do {
                        // make sure this JSON is in the format we expect
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            // try to read out a string array
                            if let tweets = json["statuses"] as? [String] {
                                print(tweets)
                            }
                        }
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                })
            }
        }
    }
    
    private func isValidInput(email: String, password: String) -> Bool {
        // add regex
        guard !email.isEmpty, !password.isEmpty else {
            return false
        }
        return true
    }
    
}
