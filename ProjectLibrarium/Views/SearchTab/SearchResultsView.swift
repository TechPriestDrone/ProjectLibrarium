//
//  SearchResultsView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 22/08/2023.
//

import SwiftUI

struct SearchResultsView: View {
    
    var book: SearchResults
    var readBooks: [ReadBooksModel]
    
    var body: some View {
//        Text(book.title)
        if let author = book.authorName?.first {
            Text("By: \(author)")
        }
        HStack{
            Image(systemName: "star")
            if let rating = book.averageRating {
                Text(String(rating))
            }
            if let test = Constants.checkIfBookIsRead(bookToCheck: book, array: readBooks){
                Image(systemName: test)
            }
        }
        Divider()
    }
}

//struct SearchResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultsView(book: SearchResults(id: "asa", title: "dsds", authorId: ["asdd"], authorName: ["asdsd"], amazonId: ["ssasd"], goodreadsId: ["sdf"], averageRating: 5.0, coverId: 123))
//    }
//}
