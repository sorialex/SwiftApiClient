//
//  Posts.swift
//  SwiftAPIClient
//
//  Created by Alex Sori on 19/2/16.
//  Copyright © 2016 Swift Test. All rights reserved.
//

import Foundation

enum FetchPostsConnection : NetworkTask {
    case ReadAll(Configuration)
    case ReadPost(String, Configuration)
    
    var configuration: Configuration {
        switch self {
        case .ReadAll(let config): return config
        case .ReadPost(_, let config): return config
        }
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var encoding: HTTPEncoding {
        return .URL
    }
    
    var path: String {
        switch self {
        case .ReadAll:
            return "posts"
        case .ReadPost(let postIdentifier, _):
            return "posts/\(postIdentifier)"
        }
    }
    
    var params: [String: String] {
        return [:]
    }
    
    var URLRequest: NSURLRequest? {
        switch self {
        case .ReadAll(_):
            return request()
        case .ReadPost(_, _):
            return request()
        }
    }
}