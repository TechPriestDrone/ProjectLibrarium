//
//  SwiftUIView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 18/09/2023.


import SwiftUI

struct SortByAuthorView: View {
    @StateObject var librariumViewModel: LibrariumViewModel
    var listOfBooks: [ReadBooksModel]
    
    var body: some View {
        
        List(librariumViewModel.sortedByAuthorBookList, id: \.author) { book in
            DisclosureGroup {
                ForEach(book.works, id: \.bookInfo.id) { result in
                    NavigationLink {
                        ReadBooksDetailsView(librariumViewModel: librariumViewModel, book: result)
                    } label: {
                        HStack{
                            Text(result.bookInfo.title).font(.system(size: 15))
                            Spacer()
                            if result.favorite {
                                Image(systemName: "rosette")
                            }
                        }
//                                BookOnShelfView(bookTitle: result.bookInfo.title, isFavorite: result.favorite)
                    }
                }
            } label: {
                Text(book.author).font(.system(size: 25))
            }
        }
        .scrollContentBackground(.hidden)
//            .listStyle(.plain)
        .background {
            Color("PageColor")
        }
        
    }
}

//struct SwiftUIView2_Previews: PreviewProvider {
//    static var previews: some View {
//        SortByAuthorView(librariumViewModel: LibrariumViewModel(searchType: SearchServicesMock()), listOfBooks:LibrariumViewModel(searchType: SearchServicesMock()).readBookList)
//    }
//}
