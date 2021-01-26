//
//  LoginPresenter.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import Foundation
import TwitterKit


class LoginPresenter {
    
    private weak var view: LoginView?
    private var getLastTweetUseCase: GetLastTweetUseCase?
    private var getProfilePictureUseCase: GetProfilePictureUseCase?
    #warning("I know I know... :D time was precious here (suggest Queue?")
    private var numberOfFulfilledRequests = 0
    private var profileResponse = ProfilePictureResponse(pictureURL: "")
    private var lastTweetResponse = GetLastTweetResponse(tweet: "")
    
    init(view: LoginView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setViews()
    }
    
    func login(with username: String?) {
        guard let username = username, !username.isEmpty else {
            view?.displayError(with: "Empty field", message: "Please complete the field first.")
            return
        }
        getLastTweetUseCase = GetLastTweetUseCase(handler: self, request: username)
        getLastTweetUseCase?.execute()
        
        getProfilePictureUseCase = GetProfilePictureUseCase(handler: self, request: username)
        getProfilePictureUseCase?.execute()
    }
}

extension LoginPresenter: GetLastTweetPresentation {
    
    func handleSuccess(response: GetLastTweetResponse) {
        numberOfFulfilledRequests += 1
        lastTweetResponse.tweet = response.tweet
        if numberOfFulfilledRequests > 1 {
            numberOfFulfilledRequests = 0
            view?.navigateToUserDetails(usingDataTransport: lastTweetResponse, pictureURL: profileResponse)
        }
    }
    
    func handleFailure(error: Error) {
        numberOfFulfilledRequests = 0
        view?.displayError(with: "Error", message: error.localizedDescription)
    }
    
}

extension LoginPresenter: GetProfilePicturePresentation {
    
    func handleSuccess(response: ProfilePictureResponse) {
        numberOfFulfilledRequests += 1
        profileResponse.pictureURL = response.pictureURL
        if numberOfFulfilledRequests > 1 {
            numberOfFulfilledRequests = 0
            view?.navigateToUserDetails(usingDataTransport: lastTweetResponse, pictureURL: profileResponse)
        }
    }
    
    func handleProfileFetchFailure(error: Error) {
        numberOfFulfilledRequests = 0
        view?.displayError(with: "Error", message: error.localizedDescription)
    }
    
    
}
