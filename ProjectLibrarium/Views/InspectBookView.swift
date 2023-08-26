//
//  InspectBookView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 26/08/2023.
//

import SwiftUI

struct InspectBookView: View {
    let book: SearchResults
    var body: some View {
        VStack{
            if let coverId = book.coverId,
               let authorName = book.authorName?.first,
               let averageRating = book.averageRating {
                Text("\(book.title)")
                Text("\(authorName)")
                AsyncImage(url: URL(string: "https://covers.openlibrary.org/b/id/\(coverId)-M.jpg"))
                Text(String(averageRating))
            }
        }
    }
}

struct InspectBookView_Previews: PreviewProvider {
    static var previews: some View {
        InspectBookView(book: SearchResults(id: "123124", title: "ABC", authorId: ["Asimov"], authorName: ["Issac Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.3, coverId: 7890714))
    }
}
