//
//  BookShelfView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 29/08/2023.
//

import SwiftUI

struct BookShelfView: View {
    let listOfBooks: [SearchResults]
    let titleOfPage: String
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
//        GridItem(.flexible()),

    ]
    
    var body: some View {
        NavigationView{
            VStack{
                Text("\(titleOfPage)")
                Spacer()
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(listOfBooks){ book in
                        BookOnShelfView(bookTitle: book.title, isFavorite: nil)
                    }
                }
                .padding()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BookShelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookShelfView(listOfBooks: [SearchResults(id: "HELLO", title: "ABC", authorId: ["ASDF"], authorName: ["ASSSD"], amazonId: ["asss"], goodreadsId: ["ssdsd"], averageRating: 3.1, coverId: 7890714),
                                    SearchResults(id: "123123", title: "Foundation", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 5.0, coverId: 7890714),
                                    SearchResults(id: "123124", title: "Life Of Pi", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: nil, coverId: 7890714),
                                    SearchResults(id: "123124", title: "ABC", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.3, coverId: 7890714)
], titleOfPage: "Test")
    }
}
