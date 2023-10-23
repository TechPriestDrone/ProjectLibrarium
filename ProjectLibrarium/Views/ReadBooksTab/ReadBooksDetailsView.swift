//
//  ReadBooksDetailsSheetView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 01/09/2023.
//

import SwiftUI
import NukeUI

struct ReadBooksDetailsView: View {
    @StateObject var librariumViewModel: LibrariumViewModel
    var book: ReadBooksModel
    
    var body: some View {
        ScrollView {
            Button {
                librariumViewModel.addBookToFavorites(bookId: book.bookInfo.id)
            } label: {
                if book.favorite != true {
                    ButtonView(buttonText: "FAVORITE", buttonType: .favorite)
                }
            }

            Text(book.bookInfo.title)
            if let authorName = book.bookInfo.authorName?.first {
                Text("By: \(authorName)")
            }
            Text("Summary: \(book.bookDetails.description)")
                .padding()
            Spacer()
            HStack{
                Button {
                    librariumViewModel.removeFromReadBook(bookId: book.bookInfo.id)
                } label: {
                    ButtonView(buttonText: "LIST", buttonType: .remover)
                }
                Spacer()
                Button {
                    librariumViewModel.removeFromFavorites(bookId: book.bookInfo.id)
                } label: {
                    if book.favorite == true {
                        ButtonView(buttonText: "FAVORITES", buttonType: .remover)
                    }
                }

            }

        }
        .background {
            Color("PageColor")
                .ignoresSafeArea()
            
        }
    }
}

struct ReadBooksDetailsSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ReadBooksDetailsView(librariumViewModel: LibrariumViewModel(searchService: SearchServicesMock()), book: ReadBooksModel(bookInfo: SearchResults(id: "122", title: "HELLO", authorId: ["ASSISOO"], authorName: ["ALUCARD"], amazonId: nil, goodreadsId: nil, averageRating: 4.0), bookDetails: OpenLibrarySingleWorkResponse(title: "HELLO", description: "very gud book i recomend", covers: [123])))
    }
}
