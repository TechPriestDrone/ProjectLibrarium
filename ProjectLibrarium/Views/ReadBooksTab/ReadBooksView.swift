//
//  ReadBooksView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/08/2023.
//

import SwiftUI

struct ReadBooksView: View {
    @StateObject var librariumViewModel: LibrariumViewModel
    
    var body: some View {
        ScrollView{
            if let booksForList = librariumViewModel.readBookList {
                ReadBooksShelfView(librariumViewMode: librariumViewModel, listOfBooks: booksForList)
//                    .onTapGesture {
//                        librariumViewModel.showSheetBookInspect = true
//                    }
//                    .sheet(isPresented: $librariumViewModel.showSheetBookInspect) {
//                        Text("YAY IT WORKS \(book)")
//                    }
            }
        }
//        VStack{
//            Text("READ BOOKS")
//            LazyImage(url: URL(string: "https://covers.openlibrary.org/b/id/7890714-M.jpg"))
//        }
    }
}

struct ReadBooksView_Previews: PreviewProvider {
    static var previews: some View {
        ReadBooksView(librariumViewModel: LibrariumViewModel(searchType: SearchServicesMock()))
    }
}
