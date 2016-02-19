//
//  APIClient.swift
//  SwiftAPIClient
//
//  Created by Alex Sori on 18/2/16.
//  Copyright © 2016 Swift Test. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case GET = "GET", POST = "POST"
}

public enum HTTPEncoding: Int {
    case URL, JSON
}

public protocol Configuration {
    var apiEndpoint: String { get }
}

public protocol NetworkTask {
    var method: HTTPMethod { get }
    var path: String { get }
    var encoding: HTTPEncoding { get }
    var params: [String: String] { get }
    var configuration: Configuration { get }
    
    func request() -> NSURLRequest?
}

public extension NetworkTask {
    public func request() -> NSURLRequest? {
        let URLString = configuration.apiEndpoint.stringByAppendingString(path);
        let parameters = encoding == .JSON ? [:] : params;
        return request(URLString, parameters: parameters);
    }
    
    public func request(urlString: String, parameters: [String: String]) -> NSURLRequest? {
        let requestURL = NSURL(string: urlString);
        return NSURLRequest(URL: requestURL!);
    }
}

public struct APIConfiguration: Configuration {
    public var apiEndpoint: String
    
    public init(url: String = "http://jsonplaceholder.typicode.com/") {
        apiEndpoint = url
    }
}