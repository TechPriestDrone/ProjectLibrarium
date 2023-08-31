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
                    TabView {
                        ForEach(covers, id: \.self) { cover in
                            LazyImage(url: URL(string: "https://covers.openlibrary.org/b/id/\(cover)-M.jpg")) { state in
                                if let image = state.image {
                                    image // Displays the loaded image.
                                } else if state.error != nil {
                                    Text(state.error?.localizedDescription ?? "ERROR!")
                                    Color.red // Indicates an error.
                                } else {
                                    ProgressView()
                                }
                            }
                            .frame(width: 200, height: 300)
                        }

                    }
//                    LazyImage(url: URL(string: "https://covers.openlibrary.org/b/id/\(coverId)-M.jpg")) { state in
//                        if let image = state.image {
//                            image // Displays the loaded image.
//                        } else if state.error != nil {
//                            Text(state.error?.localizedDescription ?? "ERROR!")
//                            Color.red // Indicates an error.
//                        } else {
//                            ProgressView()
//                        }
//                    }
//                    .frame(width: 200, height: 200)
//                    .task {
//                        for i in i ..< covers.count {
//                            book.coverId = covers[i]
//                            if i == covers.count - 1 {
//                                i = 0
//                            }
//                        }
//                    }
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

                    
//                    MainActor{
//                        if let coversArray = covers {
//                            for i in i ..< covers.count {
//                                
//                                Task{
//                                    Task.sleep(nanoseconds: NSEC_PER_SEC * 5)
//                                    book.coverId = covers[i]
//                                }
//                            }
//                        }
//                    }
                } else {
                    ProgressView()
                }
        }
        .task {
            Nuke.DataLoader.sharedUrlCache.removeAllCachedResponses()
            await librariumViewModel.fetchBookDetailsFromOpenLibrary(bookId: book.id)
        }
        // switch to on appear to not stop the loading of passed details.
    }
}

struct InspectBookView_Previews: PreviewProvider {
    static var previews: some View {
        InspectBookView(librariumViewModel: LibrariumViewModel(searchType: SearchServicesMock()), book: SearchResults(id: "123124", title: "ABC", authorId: ["Asimov"], authorName: ["Issac Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.34534, coverId: 7890714))
    }
}
