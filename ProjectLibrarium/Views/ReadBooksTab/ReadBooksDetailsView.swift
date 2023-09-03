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
                HStack{
                    Text(book.favorite ? "": "Add To favorites  \(Image(systemName: "rosette"))")
                }
            }

            Text(book.bookInfo.title)
//            CoversDisplayView(coversToDisplay: book.bookDetails.covers)
//            makes the view crash due to memory aces. might be a nuke issue
            Text("Summary: \(book.bookDetails.description)")
            Spacer()
            HStack{
                Button {
                    librariumViewModel.removeFromReadBook(bookId: book.bookInfo.id)
                } label: {
                    Text("REMOVE from list")
                }
                Spacer()
                Button {
                    librariumViewModel.removeFromFavorites(bookId: book.bookInfo.id)
                } label: {
                    Text(book.favorite ? "REMOVE from FAVORITES" : "")
                }

            }

        }
        .padding()
    }
}

//struct ReadBooksDetailsSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReadBooksDetailsSheetView()
//    }
//}
