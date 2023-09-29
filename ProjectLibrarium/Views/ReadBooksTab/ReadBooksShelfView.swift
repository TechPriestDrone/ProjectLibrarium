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
    var sortBy: LibrariumViewModel.SortByOptions
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                Text("My Library has \(String(librariumViewModel.readBookList.count)) books")
                    .onTapGesture {
                        print(librariumViewModel.readBookList)
                    }
                Spacer()
                switch librariumViewModel.sortBy {
                case .favorites : SortedView(librariumViewModel: librariumViewModel, listOfBooks: listOfBooks)
                case .bookTitle: SortedView(librariumViewModel: librariumViewModel, listOfBooks: listOfBooks)
                case .authorName: SortByAuthorView(librariumViewModel: librariumViewModel, listOfBooks: librariumViewModel.readBookList)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(content: {
                        Button("Book Title") {
                            librariumViewModel.sortBy = .bookTitle
                            librariumViewModel.readBookList.sort { $0.bookInfo.title < $1.bookInfo.title }
                        }
                        Button("Author Name") {
                            librariumViewModel.sortBy = .authorName
                            print(librariumViewModel.sortedByAuthorBookList.count)
                        }
                        Button("Favorites") {
                            librariumViewModel.sortBy = .favorites
                            librariumViewModel.readBookList.sort { $0.favorite && !$1.favorite}
                        }
                         
                    }, label: {
                        Text("Sort By")
                    }
                    )
                 }
             }
            .background {
                Color("PageColor")
                    .ignoresSafeArea()
            }
        }
    }
}

//struct ReadBooksShelfView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReadBooksShelfView()
//    }
//}
