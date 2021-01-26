//
//  GetProfilePictureUseCase.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 26/01/2021.
//

import Foundation
import SwiftyJSON
import TwitterKit


class GetProfilePictureUseCase: UseCase {
    
    private let handler: GetProfilePicturePresentation
    private let request: String
    
    init(handler: GetProfilePicturePresentation, request: String) {
        self.handler = handler
        self.request = request
    }
    
    func execute() {
        
        let client = TWTRAPIClient()
        let error: NSErrorPointer = nil
        let parameters = createParametersFor(request: request)
        
        let request = client.urlRequest(withMethod: "GET", urlString: "https://api.twitter.com/1.1/users/show.json", parameters: parameters, error: error)
        if error == nil {
            client.sendTwitterRequest(request) { (response, data, error) in
                if let error = error {
                    self.handler.handleProfileFetchFailure(error: error)
                    return
                }
                guard let data = data else {
                    let error = NSError(domain: "No data received", code: -999, userInfo: nil)
                    self.handler.handleProfileFetchFailure(error: error)
                    return
                }
                do {
                    let json = try JSON(data: data)
                    let pictureURL = json["profile_image_url_https"].stringValue
                    let apiResponse = ProfilePictureResponse(pictureURL: pictureURL)
                    self.handler.handleSuccess(response: apiResponse)
                } catch (let error) {
                    self.handler.handleProfileFetchFailure(error: error)
                }
                
            }
        }
    }
    
    private func createParametersFor(request: String) -> [String: String] {
        return ["screen_name": request]
        
    }
    
}

