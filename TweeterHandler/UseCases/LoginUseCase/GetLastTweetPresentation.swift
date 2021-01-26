//
//  GetLastTweetPresentation.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import Foundation

protocol GetLastTweetPresentation {
    func handleSuccess(response: GetLastTweetResponse)
    func handleFailure(error: Error)
}
