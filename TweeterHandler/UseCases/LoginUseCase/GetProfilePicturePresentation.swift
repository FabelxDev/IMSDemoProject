//
//  GetProfilePicturePresentation.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 26/01/2021.
//

import Foundation


protocol GetProfilePicturePresentation {
    func handleSuccess(response: ProfilePictureResponse)
    func handleProfileFetchFailure(error: Error)
}
