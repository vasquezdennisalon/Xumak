//
//  Book.swift
//  Xumak
//
//  Created by Denis Vásquez on 25/11/21.
//

import Foundation

/// Observable object to detect the response of book webservices
class Book: ObservableObject, RandomAccessCollection {
    /// Attributes
    typealias Element = BookItem
    @Published var booksItem = [BookItem]()
    @Published var state = emptyState.loading.rawValue
    var startIndex: Int { booksItem.startIndex }
    var endIndex: Int { booksItem.endIndex }
    
    /// Constructor
    init() {
        self.state = emptyState.loading.rawValue
        Shared.shared.fetch(url: WSUrl.book.rawValue, callback: bookResponse)
    }
    
    ///enable you to query instances of a type by writing
    /// - Parameters:
    ///     - position: position of the element in the array
    subscript(position: Int) -> BookItem {
        return booksItem[position]
    }
    
    
    /// Response web services
    /// - Parameters:
    ///   - data: web service response
    ///   - urlResponse: object represents a URL load response
    ///   - error: error response data
    func bookResponse(data: Data?, urlResponse: URLResponse?, error: Error?) {
        guard error == nil else {
            self.state = emptyState.error.rawValue
            return
        }
        
        guard let data = data else {
            self.state = emptyState.noContent.rawValue
            return
        }

        self.booksItem = getBooks(content: data)
        self.state = (self.booksItem.count == 0)
                    ? emptyState.noContent.rawValue
                    : emptyState.content.rawValue
    }
    
    /// get information of the books
    /// - Parameter content: web service response
    /// - Returns: book arrangement
    func getBooks(content: Data) -> [BookItem] {
        let jsonObject = try! JSONSerialization.jsonObject(with: content)
        let jsonMapList = jsonObject as! [[String: Any]]
        var booksItem = [BookItem]()
        for book in jsonMapList {
            guard let title = book["title"] as? String else {
                continue
            }
            guard let author = book["author"] as? String else {
                continue
            }
            guard let imageURL = book["imageURL"] as? String else {
                continue
            }
            booksItem.append(BookItem(title: title, image: imageURL, author: author))
        }
        return booksItem
    }
}
