//
//  GetLastTweetUseCase.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import Foundation
import SwiftyJSON
import TwitterKit


class GetLastTweetUseCase: UseCase {
    
    private let handler: GetLastTweetPresentation
    private let request: String
    
    init(handler: GetLastTweetPresentation, request: String) {
        self.handler = handler
        self.request = request
    }
    
    func execute() {
        
        let client = TWTRAPIClient()
        let error: NSErrorPointer = nil
        let parameters = createParametersFor(request: request)
        
        let request = client.urlRequest(withMethod: "GET", urlString: "https://api.twitter.com/1.1/statuses/user_timeline.json", parameters: parameters, error: error)
        if error == nil {
            client.sendTwitterRequest(request) { (response, data, error) in
                if let error = error {
                    self.handler.handleFailure(error: error)
                    return
                }
                guard let data = data else {
                    let error = NSError(domain: "No data received", code: -999, userInfo: nil)
                    self.handler.handleFailure(error: error)
                    return
                }
                do {
                    let json = try JSON(data: data)
                    let lastTweet = json[0]["text"].stringValue
                    let apiResponse = GetLastTweetResponse(tweet: lastTweet)
                    self.handler.handleSuccess(response: apiResponse)
                } catch (let error) {
                    self.handler.handleFailure(error: error)
                }
                
            }
        }
    }
    
    private func createParametersFor(request: String) -> [String: String] {
        return ["screen_name": request]
        
    }
    
}
