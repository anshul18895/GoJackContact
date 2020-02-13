//
//  APIError.swift
//  GoJackPractical
//
//  Created by admin on 13/02/20.
//  Copyright © 2020 anshul shah. All rights reserved.
//

import Foundation

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
}
