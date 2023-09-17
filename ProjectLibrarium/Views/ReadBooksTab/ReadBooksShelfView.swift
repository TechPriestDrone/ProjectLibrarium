//
//  ReadBooksShelfView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 01/09/2023.
//

import SwiftUI

struct ReadBooksShelfView: View {
    @StateObject var librariumViewModel: LibrariumViewModel
    let listOfBooks: [ReadBooksModel]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                Button {
                    librariumViewModel.readBookList.sort { $0.bookInfo.title < $1.bookInfo.title }
                } label: {
                    Text("SORT BY NAME")
                }
                Button {
                    librariumViewModel.readBookList.sort { $0.bookInfo.authorId?.first ?? "A" < $1.bookInfo.authorId?.first ?? "A" }
                } label: {
                    Text("SORT BY Author")
                }
                Button {
                    librariumViewModel.readBookList.sort { $0.favorite && !$1.favorite}
                } label: {
                    Text("SORT BY FAVORITE")
                }

                Text("My Library has \(String(librariumViewModel.readBookList.count)) books")
                    .onTapGesture {
                        print(librariumViewModel.readBookList)
                    }
                Spacer()
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(listOfBooks, id: \.bookInfo.id){ book in
                        NavigationLink {
                            ReadBooksDetailsView(librariumViewModel: librariumViewModel, book: book)
                        } label: {
                            BookOnShelfView(bookTitle: book.bookInfo.title, isFavorite: book.favorite)
                        }
                    }
                }
                .padding()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct ReadBooksShelfView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReadBooksShelfView()
//    }
//}
