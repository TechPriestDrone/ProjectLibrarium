//
//  ReadBooksShelfView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 01/09/2023.
//

import SwiftUI

struct ReadBooksShelfView: View {
    @StateObject var librariumViewMode: LibrariumViewModel
    let listOfBooks: [ReadBooksModel]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                Text("My Library")
                Spacer()
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(listOfBooks, id: \.bookInfo.id){ book in
                        NavigationLink {
                            ReadBooksDetailsView(librariumViewModel: librariumViewMode, book: book)
                        } label: {
                            BookOnShelfView(bookTitle: book.bookInfo.title, isFavorite: book.favorite)
                        }

//                        Button {
//                            librariumViewMode.showSheetBookInspect = true
//                            print("clicked on \(book.bookInfo.title)")
//                        } label: {
//                            BookOnShelfView(bookTitle: book.bookInfo.title)
//                                .sheet(isPresented: $librariumViewMode.showSheetBookInspect){
//                                    ReadBooksDetailsSheetView(book: book)
//                                }
//                        }
//                        BookOnShelfView(bookTitle: book.bookInfo.title)
//                            .sheet(isPresented: $librariumViewMode.showSheetBookInspect, content: {
//                                ReadBooksDetailsSheetView(book: book)
//                            })
//                            .onTapGesture {
//                                librariumViewMode.showSheetBookInspect = true
//                            }
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
