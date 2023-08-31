//
//  ReadBooksView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/08/2023.
//

import SwiftUI
import NukeUI

struct ReadBooksView: View {
    @StateObject var librariumViewModel: LibrariumViewModel
    
    var body: some View {
        ScrollView{
            if let booksForList = librariumViewModel.readBookList.map {$0.bookInfo} {
                BookShelfView(listOfBooks: booksForList, titleOfPage: "Book I have read")
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
