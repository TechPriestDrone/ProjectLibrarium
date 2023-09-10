//
//  InspectBookView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 26/08/2023.
//

import SwiftUI
import NukeUI
import Nuke

struct InspectBookView: View {
    @StateObject var librariumViewModel: LibrariumViewModel
    var book: SearchResults
    var i: Int = 0
    var body: some View {
        ScrollView{
                if let coverId = book.coverId,
                   let authorName = book.authorName?.first,
                   let averageRating = book.averageRating,
                   let covers = librariumViewModel.singleBookDetails.covers {
                    Text("Title: \(book.title)")
                    Text("Author: \(authorName)")
                    CoversDisplayView(coversToDisplay: covers)
                    .frame(height: 300)
                    .tabViewStyle(PageTabViewStyle())

                    
                    HStack{
                        Image(systemName: "star")
                        Text(String(averageRating))
                    }
                    Text("Summary: \(librariumViewModel.singleBookDetails.description)")
                    
                    Button {
                        librariumViewModel.addtoReadBooks(bookToAdd: ReadBooksModel(bookInfo: book, bookDetails: librariumViewModel.singleBookDetails))
                    } label: {
                        Text("READ IT")
                    }
                    .alert("ERROR Adding book", isPresented: $librariumViewModel.readBookAlreadyPresentAlert) {
                        Button("OK", role: .cancel) {}
                    } message: {
                        Text("\(book.title) is already on you READ List")
                    }

                } else {
                    ProgressView()
                }
        }
        .task {
            Nuke.DataLoader.sharedUrlCache.removeAllCachedResponses()
            await librariumViewModel.fetchBookDetailsFromOpenLibrary(bookId: book.id)
        }
//        .alert("ERROR Adding book", isPresented: $librariumViewModel.readBookAlreadyPresentAlert) {
//            Button("OK", role: .cancel) {}
//        } message: {
//            Text("\()")
//        }

    }
}

struct InspectBookView_Previews: PreviewProvider {
    static var previews: some View {
        InspectBookView(librariumViewModel: LibrariumViewModel(searchType: SearchServicesMock()), book: SearchResults(id: "123124", title: "ABC", authorId: ["Asimov"], authorName: ["Issac Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.34534, coverId: 7890714))
    }
}
