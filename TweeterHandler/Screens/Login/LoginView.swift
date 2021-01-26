//
//  LoginView.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import Foundation

protocol LoginView: class {
    func displayError(with title: String, message: String)
    func setViews()
    func navigateToUserDetails(usingDataTransport data: LoginResponse)
}
