//
//  APIClient+Extensions.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import Foundation
import Alamofire

typealias SocialMediaResponseCompletion = (AFResult<LoginResponse>) -> ()

extension APIClient {
    
    static func login(request: LoginRequest, completion: @escaping (AFResult<LoginResponse>) -> Void) {
        guard let params = request.dictionary else {
            return
        }
        let path = APIConfigs.URLs.apiBaseUrl + APIConfigs.URLs.Login.path
        post(path: path, params: params, encoding: JSONEncoding.default) { response in
            completion(response.result)
        }
    }
    
}

fileprivate extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
