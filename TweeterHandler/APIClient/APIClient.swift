//
//  APIClient.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//
import Foundation
import Alamofire


class APIClient {
    
    static func get<T: Decodable> (
        path: String,
        headers: [String: String]? = nil,
        params: [String: Any]? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        completion: @escaping(AFDataResponse<T>) -> Void) {
        
        performRequest(path: path, method: .get, headers: headers, params: params, encoding: encoding, completion: completion)
    }
    
    static func post<T: Decodable> (
        path: String,
        headers: [String: String]? = nil,
        params: [String: Any]? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        completion: @escaping(AFDataResponse<T>) -> Void) {
        performRequest(path: path, method: .post, headers: headers, params: params, encoding: encoding, completion: completion)
    }
    
    private static func performRequest<T: Decodable>(
        path: String,
        method: HTTPMethod,
        headers: [String: String]?,
        params: [String: Any]?,
        encoding: ParameterEncoding = URLEncoding.default,
        completion: @escaping(AFDataResponse<T>) -> Void) {
        
        let request = AF.request(
            path,
            method: method,
            parameters: params,
            encoding: encoding,
            headers: HTTPHeaders(headers ?? ["":""]))
        
        request.validate().responseDecodable { (response: AFDataResponse<T>) in
            
            checkResponseData(responseData: response.data)
            print("The response status code: \(String(describing: response.response?.statusCode))")
            completion(response)
        }
    }
    
    private static func checkResponseData(responseData: Data?) {
        let json = getJsonFrom(responseData: responseData)
        print("\n The response json is: \(String(describing: json))\n")
    }
    
    static func getJsonFrom(responseData: Data?) -> String? {
        if let data = responseData {
            let jsonText = String(data: data, encoding: String.Encoding.utf8)
            return jsonText
        }
        return nil
    }
    
}
