//
//  URLRequest.swift
//  GoJackPractical
//
//  Created by admin on 13/02/20.
//  Copyright © 2020 anshul shah. All rights reserved.
//

import Foundation

class APIRequest{
    class func asURLRequest(router: APIRouter) -> URLRequest?{
        guard var pathURL = router.url else {return nil}
        if router.httpMethod == .get{
            var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
            urlComponents.queryItems = APIRequest.queryParams(params: router.httpParams ?? [:])
            pathURL = urlComponents.url!
        }
        var request = URLRequest(url: pathURL)
        request.httpMethod = router.httpMethod.rawValue
        request.updateHttpBody(params: router.httpParams, method: router.httpMethod)
        return request
    }
    
    class func queryParams(params: [String:String])-> [URLQueryItem]{
        var queryParams = [URLQueryItem]()
        params.keys.forEach { key in
            queryParams.append(URLQueryItem.init(name: key, value: params[key]))
        }
        return queryParams
    }
}

extension URLRequest{
    mutating func updateHttpBody(params: [String:Any]?, method: HTTPMethod){
        guard let _params = params else { return }
        if method != .get{
            do{
                self.httpBody = try JSONSerialization.data(withJSONObject: _params, options: .prettyPrinted)
            }
            catch{
                print("Error")
            }
        }
    }
    
}
