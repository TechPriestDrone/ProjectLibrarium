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
            if let rating = book.ratings_average {
                Text("\(rating)")
            }
        }
        Divider()
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(book: SearchResults(key: "asa", title: "dsds", author_key: ["asdd"], author_name: ["asdsd"], id_amazon: ["ssasd"], id_goodreads: ["sdf"], ratings_average: 5.0))
    }
}
