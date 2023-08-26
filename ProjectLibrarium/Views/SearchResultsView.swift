//
//  SearchResultsView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 22/08/2023.
//

import SwiftUI

struct SearchResultsView: View {
    
    var book: SearchResults
    
    var body: some View {
        Text(book.title)
        HStack{
            Image(systemName: "star")
            if let rating = book.averageRating {
                Text("\(rating)")
            }
        }
        Divider()
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(book: SearchResults(id: "asa", title: "dsds", authorId: ["asdd"], authorName: ["asdsd"], amazonId: ["ssasd"], goodreadsId: ["sdf"], averageRating: 5.0))
    }
}
