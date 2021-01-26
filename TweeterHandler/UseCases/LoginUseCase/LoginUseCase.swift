//
//  LoginUseCase.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import Foundation


class LoginUseCase: UseCase {
    
    private let handler: LoginPresentation
    private let request: LoginRequest
    
    init(handler: LoginPresentation, request: LoginRequest) {
        self.handler = handler
        self.request = request
    }
    
    func execute() {
        APIClient.login(request: request) { (response) in
            
            switch response {
            case .success(let data):
                self.handler.handleUserAuthenticationSuccessful(response: data)
                print("Success login: \(data)")
            case .failure(let error):
                self.handler.handleUserAuthenticationFailure(error: error)
                print("Failed to login with error: \(error.localizedDescription)")
            }
        }
    }

}
