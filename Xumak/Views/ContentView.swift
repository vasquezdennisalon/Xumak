//
//  ContentView.swift
//  Xumak
//
//  Created by Denis Vásquez on 25/11/21.
//

import SwiftUI

/// main view
struct ContentView: View {
    @ObservedObject var bookList = Book()
        
    var body: some View {
        NavigationView {
            VStack {
                if bookList.state == emptyState.loading.rawValue {
                  ProgressView()
                } else if bookList.state == emptyState.content.rawValue {
                    List(bookList) { (book: BookItem) in
                        BookView(withBook: book)
                    }
                } else if bookList.state == emptyState.noContent.rawValue {
                    EmptyStateView(withState: tagText.noFound.rawValue)
                } else if bookList.state == emptyState.error.rawValue {
                    EmptyStateView(withState: tagText.error.rawValue)
                }
            }
            .navigationTitle(tagText.title.rawValue.uppercased())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
