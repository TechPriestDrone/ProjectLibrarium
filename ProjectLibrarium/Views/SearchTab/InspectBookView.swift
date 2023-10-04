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
                if let _ = book.coverId,
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
                            if (String(format: "%g", averageRating)) == (String(Int(averageRating.rounded(.up)))){
                                Text("\(String(format: "%g", averageRating))")
                            } else {
                                Text(String(format: "%.1f", averageRating))
                            }
                            // on the fence about wheter to allow the 5.0 or leave the logic in the view
//                        Text(String(averageRating))
                    }
                    Text("Summary: \(librariumViewModel.singleBookDetails.description)")
                        .padding()
                    
                    Button {
                        librariumViewModel.addtoReadBooks(bookToAdd: ReadBooksModel(bookInfo: book, bookDetails: librariumViewModel.singleBookDetails))
                    } label: {
                        ButtonView(buttonText: "READ IT", buttonType: .addToRead)
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
        .background {
            Color("PageColor")
                .ignoresSafeArea()
        }
        .task {
            Nuke.DataLoader.sharedUrlCache.removeAllCachedResponses()
            await librariumViewModel.fetchBookDetailsFromOpenLibrary(bookId: book.id)
        }
    }
}

struct InspectBookView_Previews: PreviewProvider {
    static var previews: some View {
        InspectBookView(librariumViewModel: LibrariumViewModel(searchService: SearchServicesMock()), book: SearchResults(id: "123124", title: "ABC", authorId: ["Asimov"], authorName: ["Issac Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.2424, coverId: 7890714))
    }
}
