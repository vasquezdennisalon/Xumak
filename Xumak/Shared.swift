//
//  shared.swift
//  Xumak
//
//  Created by Denis Vásquez on 25/11/21.
//

import Foundation

/// Singleton to load information by means of web services
class Shared {
    /// attributes
    static var shared: Shared = {
        return Shared()
    }()

    /// fecth information
    /// - Parameters:
    ///   - url: url of the ws
    ///   - callback: function to return the information
    func fetch(url: String, callback: @escaping (_ data: Data?, _: URLResponse?, _: Error?)->()) {
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: callback)
        task.resume()
    }
}
