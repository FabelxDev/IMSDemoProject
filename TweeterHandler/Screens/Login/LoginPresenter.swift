//
//  LoginPresenter.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import Foundation


class LoginPresenter {
    
    private weak var view: LoginView?
    private var loginUseCase: LoginUseCase?
    
    init(view: LoginView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setViews()
    }
    
    func login(with username: String?) {
        guard let username = username else {
            view?.displayError(with: "Empty field", message: "Please complete the field first.")
            return
        }
        loginUseCase = LoginUseCase(handler: self, request: username)
        loginUseCase?.execute()
    }
//
//    private func fetchTwitterUser(withId: String) {
//
//        let client = TWTRAPIClient()
//        client.loadUser(withID: withId) { (user, error) in
//            if let error = error {
//                self.view?.displayError(with: "Unable to fetch user", message: error.localizedDescription)
//                return
//            }
//
//            guard let user = user else {
//                self.view?.displayError(with: "Unable to fetch user", message: "")
//                return
//            }
//
//            //            let profilePictureUrl = user.profileImageURL
//            //            let name = user.screenName
//            //            let userDetails = UserDetails(username: name, photoURL: profilePictureUrl, lastTweet: nil)
//
//            let twError:NSErrorPointer = nil
//            let userId = user.userID
//
//            let client = TWTRAPIClient(userID: userId)
//            let request = client.urlRequest(withMethod: "GET", urlString: "https://api.twitter.com/1.1/search/tweets.json", parameters: ["q":"from:tamas_joseph","result_type":"recent"], error: twError)
//
//            if twError == nil {
//
//                client.sendTwitterRequest(request, completion: { (response, data, error) -> Void in
//
//                    guard let data = data else { return }
//                    do {
//                        // make sure this JSON is in the format we expect
//                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                            // try to read out a string array
//                            if let tweets = json["statuses"] as? [String] {
//                                let decoder = try JSONDecoder().decode(APIResponse.self, from: data)
//                                print(decoder)
//                                print(tweets)
//                            }
//                        }
//                    } catch let error as NSError {
//                        print("Failed to load: \(error.localizedDescription)")
//                    }
//                })
//            }
//        }
//    }
    
//    private func fetchTwitterUser() {
//        guard let session = currentSession else {
//            return
//        }
//        let client = TWTRAPIClient()
//        client.loadUser(withID: session.userID) { (user, error) in
//            if let error = error {
//                self.view?.displayError(with: "Unable to fetch user", message: error.localizedDescription)
//                return
//            }
//
//            guard let user = user else {
//                self.view?.displayError(with: "Unable to fetch user", message: "")
//                return
//            }
//
//            //            let profilePictureUrl = user.profileImageURL
//            //            let name = user.screenName
//            //            let userDetails = UserDetails(username: name, photoURL: profilePictureUrl, lastTweet: nil)
//
//            let twError:NSErrorPointer = nil
//            let userId = user.userID
//
//            let client = TWTRAPIClient(userID: userId)
//            let request = client.urlRequest(withMethod: "GET", urlString: "https://api.twitter.com/1.1/search/tweets.json", parameters: nil, error: twError)
//
//            if twError == nil {
//
//                client.sendTwitterRequest(request, completion: { (response, data, error) -> Void in
//
//                    guard let data = data else { return }
//                    do {
//                        // make sure this JSON is in the format we expect
//                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                            // try to read out a string array
//                            if let tweets = json["statuses"] as? [String] {
//                                let decoder = try JSONDecoder().decode(APIResponse.self, from: data)
//                                print(tweets)
//                            }
//                        }
//                    } catch let error as NSError {
//                        print("Failed to load: \(error.localizedDescription)")
//                    }
//                })
//            }
//        }
//    }
//
//    private func isValidInput(email: String, password: String) -> Bool {
//        // add regex
//        guard !email.isEmpty, !password.isEmpty else {
//            return false
//        }
//        return true
//    }
    
}


extension LoginPresenter: LoginPresentation {
    
    func handleUserAuthenticationSuccessful(response: LoginResponse) {
        view?.navigateToUserDetails(usingDataTransport: response)
    }
    
    func handleUserAuthenticationFailure(error: Error) {
        view?.displayError(with: "Error", message: error.localizedDescription)
    }
    
    
}
