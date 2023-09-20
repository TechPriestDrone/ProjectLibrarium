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
        VStack{
            Text("Sorted By Author")
                .task {
                    librariumViewModel.sortedByAuthorBookList = librariumViewModel.sortBooksByAuthor(passedArray: listOfBooks)
                    print(librariumViewModel.sortedByAuthorBookList)
                    librariumViewModel.sortedByAuthorBookList.sort {$0.author < $1.author}
                }
            List(librariumViewModel.sortedByAuthorBookList, id: \.author) { book in
                Section{
                    ForEach(book.works, id: \.bookInfo.id) { result in
                        Text(result.bookInfo.title)
                    }
                } header: {
                    Text(book.author)
                }
            }
            .listStyle(.sidebar)
        }
        
    }
}

struct SwiftUIView2_Previews: PreviewProvider {
    static var previews: some View {
        SortByAuthorView(librariumViewModel: LibrariumViewModel(searchType: SearchServicesMock()), listOfBooks:LibrariumViewModel(searchType: SearchServicesMock()).readBookList)
    }
}
