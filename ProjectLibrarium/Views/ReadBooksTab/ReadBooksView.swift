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
        VStack{
            let booksForList = librariumViewModel.readBookList
                ReadBooksShelfView(librariumViewModel: librariumViewModel, listOfBooks: booksForList, sortBy: .favorites)
            
        }
        .background {
            Color("PageColor")
        }
    }
}

struct ReadBooksView_Previews: PreviewProvider {
    static var previews: some View {
        ReadBooksView(librariumViewModel: LibrariumViewModel(searchService: SearchServicesMock()))
    }
}
