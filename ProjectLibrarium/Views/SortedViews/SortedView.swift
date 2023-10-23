//
//  SortedView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/09/2023.
//

import SwiftUI

struct SortedView: View {
    @StateObject var librariumViewModel: LibrariumViewModel
    let listOfBooks: [ReadBooksModel]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
//        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(listOfBooks, id: \.bookInfo.id){ book in
                    NavigationLink {
                        ReadBooksDetailsView(librariumViewModel: librariumViewModel, book: book)
                    } label: {
                        BookOnShelfView(bookTitle: book.bookInfo.title, isFavorite: book.favorite)
                    }
                }
            }
        }
        .padding()
        .background {
            Color("PageColor")
        }
    }
}

//struct SortedView_Previews: PreviewProvider {
//    static var previews: some View {
//        SortedView()
//    }
//}
