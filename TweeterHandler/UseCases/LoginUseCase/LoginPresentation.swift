//
//  LoginPresentation.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import Foundation

protocol LoginPresentation {
    func handleUserAuthenticationSuccessful(response: LoginResponse)
    func handleUserAuthenticationFailure(error: Error)
}
