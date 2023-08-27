//
//  InspectBookView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 26/08/2023.
//

import SwiftUI
import NukeUI

struct InspectBookView: View {
    @StateObject var librariumViewModel: LibrariumViewModel
    var book: SearchResults
    var i: Int = 0
    var body: some View {
        ScrollView{
            VStack{
                if let coverId = book.coverId,
                   let authorName = book.authorName?.first,
                   let averageRating = book.averageRating,
                   let covers = librariumViewModel.singleBookDetails.covers {
                    Text("Title: \(book.title)")
                    Text("Author: \(authorName)")
                    LazyImage(url: URL(string: "https://covers.openlibrary.org/b/id/\(coverId)-M.jpg"))
                    Text("Rating: \(String(averageRating))")
                    Text("Summary: \(librariumViewModel.singleBookDetails.description)")
                }
            }
        }
        .task {
            await librariumViewModel.fetchBookDetailsFromOpenLibrary(bookId: book.id)
        }
    }
}

struct InspectBookView_Previews: PreviewProvider {
    static var previews: some View {
        InspectBookView(librariumViewModel: LibrariumViewModel(searchType: SearchServicesMock()), book: SearchResults(id: "123124", title: "ABC", authorId: ["Asimov"], authorName: ["Issac Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.3, coverId: 7890714))
    }
}
