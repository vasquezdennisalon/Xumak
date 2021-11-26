//
//  Constants.swift
//  Xumak
//
//  Created by Denis Vásquez on 25/11/21.
//

import Foundation

/// Constant variables throughout the app
enum WSUrl : String {
    case book = "https://de-coding-test.s3.amazonaws.com/books.json"
}

/// Constant empty state
enum emptyState : Int {
    case loading = 0
    case content = 1
    case noContent = 2
    case error = 3
}

enum tagText : String {
    case noFound = "No information found"
    case error = "An error has occurred"
    case title = "Books for sale"
}
