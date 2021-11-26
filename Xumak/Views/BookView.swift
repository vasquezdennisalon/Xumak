//
//  BookItemView.swift
//  Xumak
//
//  Created by Denis Vásquez on 25/11/21.
//

import SwiftUI

/// cell of the book view
struct BookView: View {
    var book: BookItem
    init(withBook book:BookItem) {
        self.book = book
    }

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: book.imageURL)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }.frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                Text("\(book.title)")
                    .padding()
            }
            Text("\(book.author)")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
        }
        
    }
}
