//
//  APIManager.swift
//  GoJackPractical
//
//  Created by admin on 13/02/20.
//  Copyright © 2020 anshul shah. All rights reserved.
//

import Foundation
import Combine

class APIManager{
    
    init() {}
    
    static var shared : APIManager = {
        let manager = APIManager()
        return manager
    }()
    
    func response<T>(from router: APIRouter, parseTo: T.Type) -> AnyPublisher<T, APIServiceError>? where T: Decodable {
        
        guard let request = router.asURLRequest() else {return nil}
        let decorder = JSONDecoder()
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, urlResponse in data }
            .mapError { _ in APIServiceError.responseError }
            .decode(type: T.self, decoder: decorder)
            .mapError(APIServiceError.parseError)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
    }
    
}
