//
//  BookItem.swift
//  Xumak
//
//  Created by Denis Vásquez on 25/11/21.
//

import Foundation

/// Book object information
class BookItem: Identifiable {
    /// Attributes
    var uuid = UUID()
    var title: String
    var imageURL: String
    var author: String
    
    /// Constructor
    /// - Parameters:
    ///   - title: book title
    ///   - image: image of the book
    ///   - author: author of the book
    init(title: String, image: String, author: String) {
        self.title = title
        self.imageURL = image
        self.author = author
    }
}
